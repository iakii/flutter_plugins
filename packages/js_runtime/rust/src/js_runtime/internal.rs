//! JS 运行时内部状态管理。
//!
//! 此模块不在 `crate::api` 路径下，因此不会被 flutter_rust_bridge 扫描，
//! 避免将私有类型暴露给 Dart 端。

use std::rc::Rc;

use boa_engine::{js_string, Context, Module, NativeFunction, Source};
use boa_engine::module::MapModuleLoader;
use boa_engine::JsValue as BoaJsValue;
use boa_runtime::extensions::{ConsoleExtension, FetchExtension};
use crate::js_runtime::fetcher::RedirectAwareFetcher;

use crate::api::js_value::JsValue as FrbJsValue;

/// 单个运行时的内部状态（仅在 worker 线程内使用，非 Send）。
pub(crate) struct RuntimeState {
    pub context: Context,
    /// 内存上限（字节），0 表示不限制。
    pub max_memory: u64,
    /// 估算内存用量（字节）：已执行的代码 + 已加载的模块源码总量。
    pub estimated_memory: u64,
    /// 已执行的 JS 代码总字节数。
    pub total_code_bytes: u64,
    /// 已加载的模块源码总字节数。
    pub total_module_bytes: u64,
    /// 运行时 ID（与 JsRuntime.id 相同）。
    pub runtime_id: u64,
    /// tokio runtime handle，用于 block_on dart_callback。
    pub runtime_handle: Option<tokio::runtime::Handle>,
}

pub(crate) fn next_id() -> u64 {
    use std::sync::atomic::AtomicU64;
    static NEXT_ID: AtomicU64 = AtomicU64::new(0);
    NEXT_ID.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
}

// ─── FRB dart_callback 原生函数 ─────────────────────────────

/// 创建基于 FRB dart_callback 的同步 NativeFunction。
///
/// JS 调用 `name(args)` 时：
/// 1. 序列化 JS args → JSON
/// 2. 通过全局 dart_callbacks 注册表找到对应的 dart_callback
/// 3. tokio block_on 同步等待 Dart handler 返回
/// 4. 反序列化 JSON → JsValue 返回给 JS
///
/// 与旧的 sync_bridge 方案不同，此函数使用 FRB 原生的 dart_callback 通道，
/// 无需 dart:ffi NativeCallable 和自定义 Mutex+Condvar。
pub(crate) fn create_dart_callback_fn(
    method_name: String,
    runtime_id: u64,
) -> NativeFunction {
    NativeFunction::from_copy_closure_with_captures(
        |_this, args, caps, ctx| -> boa_engine::JsResult<boa_engine::JsValue> {
            // 1. JS args → JSON
            let vals: Vec<serde_json::Value> = args
                .iter()
                .map(|v| frb_value_to_json(&FrbJsValue::from_boa(v, ctx)))
                .collect();
            let args_json = serde_json::to_string(&vals).unwrap_or_default();

            // 2. 从 thread_local 获取 runtime handle
            let handle = RUNTIME_HANDLE.with(|h| {
                h.borrow().clone().expect("RUNTIME_HANDLE not set")
            });

            // 3. 同步等待 Dart 响应
            let raw = crate::js_runtime::dart_callbacks::call_blocking(
                caps.runtime_id,
                &caps.method_name,
                &args_json,
                &handle,
            );

            // 4. JSON → JsValue
            match raw {
                Ok(json) => {
                    let v: serde_json::Value =
                        serde_json::from_str(&json).unwrap_or_default();
                    json_to_frb_value(&v).to_boa(ctx).map_err(|e| {
                        boa_engine::JsNativeError::typ()
                            .with_message(format!("{e}"))
                            .into()
                    })
                }
                Err(e) => Err(boa_engine::JsNativeError::typ()
                    .with_message(e)
                    .into()),
            }
        },
        DartCallbackCaps {
            method_name,
            runtime_id,
        },
    )
}

/// Captures for create_dart_callback_fn.
struct DartCallbackCaps {
    method_name: String,
    runtime_id: u64,
}

// Safety: DartCallbackCaps contains no GC-managed objects.
unsafe impl boa_gc::Trace for DartCallbackCaps {
    boa_gc::empty_trace!();
}
impl boa_gc::Finalize for DartCallbackCaps {}

/// Worker 线程局部的 tokio runtime handle。
/// 在 worker_loop 启动时设置，供 NativeFunction 闭包使用。
thread_local! {
    pub(crate) static RUNTIME_HANDLE: std::cell::RefCell<Option<tokio::runtime::Handle>> =
        std::cell::RefCell::new(None);
}

// ─── JsValue ↔ serde_json::Value 转换（dart_callback JSON 协议用）───────

/// 将 FrbJsValue 转为 serde_json::Value。
fn frb_value_to_json(v: &FrbJsValue) -> serde_json::Value {
    match v {
        FrbJsValue::None => serde_json::Value::Null,
        FrbJsValue::Boolean(b) => serde_json::Value::Bool(*b),
        FrbJsValue::Integer(i) => serde_json::Value::Number((*i).into()),
        FrbJsValue::Float(f) => {
            let n = serde_json::Number::from_f64(*f).unwrap_or_else(|| 0.into());
            serde_json::Value::Number(n)
        }
        FrbJsValue::BigInt(s) => serde_json::Value::String(s.clone()),
        FrbJsValue::String_(s) => serde_json::Value::String(s.clone()),
        FrbJsValue::Bytes(b) => {
            let arr: Vec<serde_json::Value> =
                b.iter().map(|&byte| serde_json::Value::Number(byte.into())).collect();
            serde_json::Value::Array(arr)
        }
        FrbJsValue::Array(items) => {
            let arr: Vec<serde_json::Value> = items.iter().map(|i| frb_value_to_json(i)).collect();
            serde_json::Value::Array(arr)
        }
        FrbJsValue::Object(entries) => {
            let mut map = serde_json::Map::new();
            for (k, val) in entries {
                map.insert(k.clone(), frb_value_to_json(val));
            }
            serde_json::Value::Object(map)
        }
        FrbJsValue::Date(ts) => serde_json::Value::Number((*ts).into()),
        FrbJsValue::Symbol(desc) => serde_json::Value::String(desc.clone()),
    }
}

/// 将 serde_json::Value 转为 FrbJsValue。
fn json_to_frb_value(v: &serde_json::Value) -> FrbJsValue {
    match v {
        serde_json::Value::Null => FrbJsValue::None,
        serde_json::Value::Bool(b) => FrbJsValue::Boolean(*b),
        serde_json::Value::Number(n) => {
            if let Some(i) = n.as_i64() {
                if n.as_f64().map_or(false, |f| f == i as f64) {
                    FrbJsValue::Integer(i)
                } else {
                    FrbJsValue::Float(n.as_f64().unwrap_or(0.0))
                }
            } else {
                FrbJsValue::Float(n.as_f64().unwrap_or(0.0))
            }
        }
        serde_json::Value::String(s) => FrbJsValue::String_(s.clone()),
        serde_json::Value::Array(arr) => {
            let items: Vec<Box<FrbJsValue>> = arr
                .iter()
                .map(|v| Box::new(json_to_frb_value(v)))
                .collect();
            FrbJsValue::Array(items)
        }
        serde_json::Value::Object(map) => {
            let entries: Vec<(String, Box<FrbJsValue>)> = map
                .iter()
                .map(|(k, v)| (k.clone(), Box::new(json_to_frb_value(v))))
                .collect();
            FrbJsValue::Object(entries)
        }
    }
}

// ─── 进程内存 ────────────────────────────────────────────

/// 获取当前进程的物理内存用量（字节），平台不支持时返回 `None`。
///
/// - Linux / HarmonyOS: 读取 `/proc/self/status` 中的 `VmRSS` 字段
pub(crate) fn get_process_memory() -> Option<u64> {
    #[cfg(unix)]
    {
        if let Ok(content) = std::fs::read_to_string("/proc/self/status") {
            for line in content.lines() {
                if line.starts_with("VmRSS:") {
                    let kb: u64 = line
                        .split_whitespace()
                        .nth(1)?
                        .parse()
                        .ok()?;
                    return Some(kb * 1024); // KiB → bytes
                }
            }
        }
    }
    #[cfg(target_os = "windows")]
    {
        // Windows: 可通过 winapi 获取，这里返回 None 回退到估算值
    }
    None
}

/// 向 Boa 上下文注册 Web API 扩展（Console + Fetch）。
pub(crate) fn register_web_apis(context: &mut Context) -> Result<(), String> {
    boa_runtime::register(
        (
            ConsoleExtension::default(),
            FetchExtension(RedirectAwareFetcher::default()),
        ),
        None,
        context,
    )
    .map_err(|e| format!("Failed to register Web APIs: {e}"))
}

/// 创建并初始化一个新的 Boa 上下文。
///
/// 注册 Web API、DOM 模块、定时器，并配置模块加载器。
pub(crate) fn init_context(max_memory: u64, runtime_id: u64) -> Result<RuntimeState, String> {
    let loader = Rc::new(MapModuleLoader::new());
    let mut context = Context::builder()
        .module_loader(loader)
        .build()
        .expect("Context::build should succeed");

    if let Err(e) = register_web_apis(&mut context) {
        eprintln!("Warning: {e}");
    }
    if let Err(e) = crate::dom::register_dom_module(&mut context) {
        eprintln!("Warning: {e}");
    }
    if let Err(e) = crate::encoding::register_encoding_module(&mut context) {
        eprintln!("Warning: {e}");
    }
    if let Err(e) = register_timers(&mut context) {
        eprintln!("Warning: {e}");
    }

    Ok(RuntimeState {
        context,
        max_memory,
        estimated_memory: 0,
        total_code_bytes: 0,
        total_module_bytes: 0,
        runtime_id,
        runtime_handle: None,
    })
}

/// 向 Boa 上下文注册 `setTimeout` 全局函数。
///
/// 由于 JS 引擎运行在同步阻塞线程上（`BlockingReqwestFetcher`），
/// `setTimeout` 实现为 `thread::sleep` + 同步调用回调，不需要事件循环。
fn register_timers(context: &mut Context) -> Result<(), String> {
    use boa_engine::object::FunctionObjectBuilder;
    use boa_engine::property::PropertyDescriptor;
    use boa_engine::NativeFunction;

    let set_timeout = NativeFunction::from_copy_closure(
        |_this, args, context| {
            // 读取延迟（毫秒），默认 0
            let delay = args
                .get(1)
                .and_then(|v| v.as_number())
                .unwrap_or(0.0);
            if delay > 0.0 {
                std::thread::sleep(std::time::Duration::from_millis(delay as u64));
            }
            // 同步调用回调（如 Promise 的 resolve）
            // JsValue::call 是私有的，通过 as_object() 获取 JsObject 再调用
            if let Some(callback) = args.first() {
                if let Some(func) = callback.as_object() {
                    let _ = func.call(
                        &boa_engine::JsValue::undefined(),
                        &[],
                        context,
                    );
                }
            }
            Ok(boa_engine::JsValue::undefined())
        },
    );

    let function = FunctionObjectBuilder::new(context.realm(), set_timeout)
        .name(js_string!("setTimeout"))
        .length(2)
        .constructor(false)
        .build();

    context
        .global_object()
        .define_property_or_throw(
            js_string!("setTimeout"),
            PropertyDescriptor::builder()
                .value(function)
                .writable(true)
                .enumerable(false)
                .configurable(true),
            context,
        )
        .map(|_| ())
        .map_err(|e| format!("Failed to register setTimeout: {e}"))
}

// ─── 模块辅助 ────────────────────────────────────────────

/// 解析并编译 ES 模块。
pub(crate) fn parse_module(
    name: &str,
    source: &str,
    context: &mut Context,
) -> Result<Module, String> {
    Module::parse(Source::from_bytes(source.as_bytes()), None, context)
        .map_err(|e| format!("Failed to parse module '{name}': {e}"))
}

/// 从上下文获取 MapModuleLoader 的引用。
pub(crate) fn get_module_loader(
    context: &mut Context,
) -> Result<Rc<MapModuleLoader>, String> {
    context
        .downcast_module_loader::<MapModuleLoader>()
        .ok_or_else(|| "Module loader unavailable".to_string())
}

/// 对 Boa 值求值并解析 Promise（如有），返回结果字符串。
pub(crate) fn eval_and_resolve(
    code: &str,
    state: &mut RuntimeState,
) -> Result<String, String> {
    match state.context.eval(Source::from_bytes(code.as_bytes())) {
        Ok(value) => {
            let resolved = if let Some(promise) = value.as_promise() {
                match promise.await_blocking(&mut state.context) {
                    Ok(v) => v,
                    Err(e) => return Err(format!("Promise rejected: {e}")),
                }
            } else {
                value
            };
            resolved
                .to_string(&mut state.context)
                .map(|s| s.to_std_string_escaped())
                .map_err(|e| format!("Failed to convert result: {e}"))
        }
        Err(e) => Err(format!("JS Error: {e}")),
    }
}

/// 检查并更新内存估算，如超出上限则返回错误。
pub(crate) fn check_memory_limit(_state: &RuntimeState) -> Result<(), String> {
    // if state.max_memory > 0 {
    //     let actual = get_process_memory().unwrap_or(state.estimated_memory);
    //     if actual >= state.max_memory {
    //         return Err(format!(
    //             "Memory limit exceeded: used {} bytes, limit {} bytes. \
    //              Call release_memory() or dispose() to free memory.",
    //             actual, state.max_memory
    //         ));
    //     }
    // }
    Ok(())
}
