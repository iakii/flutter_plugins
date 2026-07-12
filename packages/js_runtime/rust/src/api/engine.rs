//! JsEngine —— 高层 JS 引擎 API。
//!
//! 参考 FJS 的 `JsEngine` 设计，封装运行时生命周期，
//! 提供更简洁的 API 供日常使用。
//!
//! 低层 API 见 [super::runtime::JsRuntime]。

use crate::api::builtin_options::JsBuiltinOptions;
use crate::api::eval_options::JsEvalOptions;
use crate::api::js_error::JsError;
use crate::api::js_value::JsValue;
use crate::api::module::JsModule;
use crate::api::runtime::{JsRuntime, JsRuntimeOptions};
use crate::js_runtime::worker;
use flutter_rust_bridge::frb;
use flutter_rust_bridge::DartFnFuture;

/// 高层 JS 引擎。
///
/// 内部持有一个 JsRuntime（专用后台工作线程），自动管理生命周期。
/// 方法失败时返回 [JsError]。
pub struct JsEngine {
    pub runtime_id: u64,
}

impl JsEngine {
    /// 创建 JS 引擎。
    ///
    /// # 参数
    /// - `builtins`: 内置模块配置，默认 [JsBuiltinOptions::essential]
    /// - `modules`: 创建后立即注册的模块列表
    /// - `runtime_options`: 底层运行时选项（内存上限等）
    #[frb(sync)]
    pub fn create(
        builtins: Option<JsBuiltinOptions>,
        modules: Option<Vec<JsModule>>,
        runtime_options: Option<JsRuntimeOptions>,
    ) -> Self {
        let mut opts = runtime_options.unwrap_or_default();
        if let Some(b) = builtins {
            opts.builtins = Some(b);
        }

        let runtime = JsRuntime::create(Some(opts));
        let id = runtime.id;

        // 注册初始模块（通过 worker channel）
        if let Some(mods) = modules {
            for m in mods {
                if let Err(e) = worker::preload_module(id, m.name, m.source) {
                    eprintln!("Warning: Failed to preload module: {e}");
                }
            }
        }

        // Runtime 已通过 worker 管理，只需保留 id
        std::mem::forget(runtime);

        Self { runtime_id: id }
    }

    /// 执行 JavaScript 代码，返回类型化的 [JsValue]。
    ///
    /// 实际执行在工作线程中进行，返回 Future，不阻塞 Dart 主 isolate。
    /// 自动解析顶层 Promise。
    pub fn eval(&self, code: String) -> Result<JsValue, JsError> {
        worker::eval(self.runtime_id, code, JsEvalOptions::default())
    }

    /// 执行 JavaScript 代码，**不**自动 resolve 顶层 Promise。
    ///
    /// 适用于 JS 代码中包含 `await registeredMethod()` 的场景，
    /// 避免 `await_blocking` 与回调等待形成死锁。
    /// 调用后需配合 [run_jobs](Self::run_jobs) 执行微任务。
    pub fn eval_raw(&self, code: String) -> Result<JsValue, JsError> {
        worker::eval_raw(self.runtime_id, code)
    }

    /// 带选项执行 JavaScript 代码。
    pub fn eval_with_options(
        &self,
        code: String,
        options: JsEvalOptions,
    ) -> Result<JsValue, JsError> {
        worker::eval(self.runtime_id, code, options)
    }

    /// 从文件路径读取 JS 代码并执行（Script 模式）。
    pub fn eval_file(
        &self,
        path: String,
        options: Option<JsEvalOptions>,
    ) -> Result<JsValue, JsError> {
        worker::eval_file(self.runtime_id, path, options.unwrap_or_default())
    }

    /// 从字节数组执行 JS 代码（UTF-8 编码）。
    pub fn eval_bytes(
        &self,
        bytes: Vec<u8>,
        options: Option<JsEvalOptions>,
    ) -> Result<JsValue, JsError> {
        worker::eval_bytes(self.runtime_id, bytes, options.unwrap_or_default())
    }

    /// 读取文件作为 ES 模块执行（支持相对路径 import）。
    ///
    /// 文件所在目录设置为模块解析基础路径。
    pub fn eval_path(
        &self,
        path: String,
        options: Option<JsEvalOptions>,
    ) -> Result<JsValue, JsError> {
        worker::eval_path(self.runtime_id, path, options.unwrap_or_default())
    }

    /// 调用已注册模块的导出函数。
    ///
    /// # 参数
    /// - `module`: 模块名称（已通过 [declare_module](Self::declare_module) 注册）
    /// - `method`: 导出函数名
    /// - `params`: 参数列表
    pub fn call(
        &self,
        module: String,
        method: String,
        params: Vec<JsValue>,
    ) -> Result<JsValue, JsError> {
        worker::call_module(self.runtime_id, module, method, params)
    }

    /// 注册一个 ES 模块。
    #[frb(sync)]
    pub fn declare_module(&self, module: JsModule) -> Result<(), JsError> {
        worker::preload_module(self.runtime_id, module.name, module.source)
    }

    /// 批量注册 ES 模块。同一批中的模块名不允许重复。
    #[frb(sync)]
    pub fn declare_modules(&self, modules: Vec<JsModule>) -> Result<(), JsError> {
        worker::declare_modules(self.runtime_id, modules)
    }

    // ─── JS↔Dart 回调注册 ───────────────────────────────

    /// 注册一个 Dart 回调作为 JS 全局函数。
    ///
    /// 使用 FRB 原生 dart_callback 机制：JS 调用 `name(args)` 时，
    /// Rust 侧通过 tokio block_on 同步等待 Dart handler 返回结果。
    /// JS 直接拿到返回值，无需 `await` / Promise。
    ///
    /// # Dart 示例
    /// ```dart
    /// await engine.register('add', (String argsJson) async {
    ///   final args = jsonDecode(argsJson) as List;
    ///   return jsonEncode(args[0] + args[1]);
    /// });
    /// final result = await engine.eval(code: 'add(3, 4) + 10'); // 17
    /// ```
    pub async fn register(
        &self,
        name: String,
        func: impl Fn(String) -> DartFnFuture<String> + Send + Sync + 'static,
    ) -> Result<(), JsError> {
        // 1. 存入全局注册表（类型擦除为 Arc）
        crate::js_runtime::dart_callbacks::register(
            self.runtime_id,
            name.clone(),
            std::sync::Arc::new(func),
        );
        // 2. 通知 worker 线程创建 NativeFunction
        worker::register(self.runtime_id, name)
    }

    /// 注销已注册的 Dart 回调（从 JS global 中删除）。
    #[frb(sync)]
    pub fn unregister(&self, name: String) -> Result<(), JsError> {
        crate::js_runtime::dart_callbacks::unregister(self.runtime_id, &name);
        worker::unregister(self.runtime_id, name)
    }

    // ─── 内存管理 ────────────────────────────────────────
    #[frb(sync)]
    pub fn memory_usage(&self) -> u64 {
        worker::memory_usage(self.runtime_id).unwrap_or(0)
    }

    /// 触发垃圾回收。
    #[frb(sync)]
    pub fn run_gc(&self) {
        worker::run_gc(self.runtime_id);
    }

    /// 执行待处理的微任务（Promise reactions）。
    #[frb(sync)]
    pub fn run_jobs(&self) {
        worker::run_jobs(self.runtime_id);
    }

    /// 设置内存上限（字节），`0` 表示不限制。
    #[frb(sync)]
    pub fn set_memory_limit(&self, limit_bytes: u64) {
        worker::set_memory_limit(self.runtime_id, limit_bytes);
    }

    /// 取消当前正在等待的 eval（或其他长时间操作）。
    ///
    /// 等待中的调用方会立刻收到 [JsError::Cancelled]。
    /// 工作线程中的 JS 执行会继续在后台完成（结果被丢弃），
    /// 取消后可以立即发起新的 eval 调用。
    #[frb(sync)]
    pub fn cancel_eval(&self) {
        worker::cancel_eval(self.runtime_id);
    }

    /// 关闭引擎，释放所有资源（含已注册的 dart_callback 和待处理调用）。
    #[frb(sync)]
    pub fn close(self) -> Result<(), JsError> {
        crate::js_runtime::dart_callbacks::unregister_all(self.runtime_id);
        worker::dispose(self.runtime_id)
    }
}
