//! 全局 dart_callback 注册表 —— 独立于 worker channel。
//!
//! FRB 的 dart_callback 机制允许 Rust 直接调用 Dart 闭包（通过 FRB 内部通道）。
//! 本模块维护一个全局注册表，按 (runtime_id, name) 索引，
//! worker 线程中的 NativeFunction 闭包通过 [call_blocking] 同步等待 Dart 响应。
//!
//! 流程:
//! 1. JsEngine::register() 将 dart_callback 存入全局表 → 通知 worker
//! 2. worker 创建 NativeFunction 注册到 JS global
//! 3. JS 调用 name(args) → NativeFunction 闭包 → call_blocking → tokio block_on → Dart handler
//! 4. Dart 返回值 → block_on 返回 → 反序列化 → 返回给 JS

use std::collections::HashMap;
use std::sync::{Arc, Mutex};

use flutter_rust_bridge::DartFnFuture;

/// 类型擦除的 dart_callback。
pub(crate) type DartCallback = Arc<dyn Fn(String) -> DartFnFuture<String> + Send + Sync + 'static>;

/// 全局注册表，按 (runtime_id, name) 索引。
static CALLBACKS: std::sync::LazyLock<Mutex<HashMap<(u64, String), DartCallback>>> =
    std::sync::LazyLock::new(|| Mutex::new(HashMap::new()));

/// 注册一个 dart_callback。
pub(crate) fn register(runtime_id: u64, name: String, cb: DartCallback) {
    CALLBACKS
        .lock()
        .expect("CALLBACKS lock poisoned")
        .insert((runtime_id, name), cb);
}

/// 注销指定 runtime 下的某个回调。
pub(crate) fn unregister(runtime_id: u64, name: &str) {
    CALLBACKS
        .lock()
        .expect("CALLBACKS lock poisoned")
        .remove(&(runtime_id, name.to_string()));
}

/// 注销指定 runtime 下的所有回调（dispose 时调用）。
pub(crate) fn unregister_all(runtime_id: u64) {
    CALLBACKS
        .lock()
        .expect("CALLBACKS lock poisoned")
        .retain(|(rid, _), _| *rid != runtime_id);
}

/// Worker 线程调用：通过 tokio block_on 同步等待 Dart 回调响应。
///
/// 返回 Dart handler 的 JSON 字符串，或错误消息。
pub(crate) fn call_blocking(
    runtime_id: u64,
    name: &str,
    args_json: &str,
    rt: &tokio::runtime::Handle,
) -> Result<String, String> {
    let cb = {
        let map = CALLBACKS.lock().map_err(|e| format!("lock: {e}"))?;
        map.get(&(runtime_id, name.to_string()))
            .ok_or_else(|| format!("'{name}' not registered"))?
            .clone()
    };

    Ok(rt.block_on(cb(args_json.to_string())))
}
