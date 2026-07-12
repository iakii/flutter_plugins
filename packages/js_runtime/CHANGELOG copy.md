## 0.0.1

* TODO: Describe initial release.

---

## 工作线程重构 (2026-06-21)

### 重大变更：JS Eval 移至后台工作线程

eval 方法不再阻塞 Dart 主 isolate。每个 `JsRuntime` 拥有一个专用 OS 线程（worker），
Boa Context 在 worker 内运行。eval 方法通过 `mpsc` channel 向 worker 发送命令。

### 新增
- `JsRuntime.eval_file(path, options?)` — 读取文件执行 JS（`Future<JsValue>`）
- `JsRuntime.eval_bytes(bytes, options?)` — 从 UTF-8 字节数组执行 JS（`Future<JsValue>`）
- `JsRuntime.eval_path(path, options?)` — 读取文件作为 ES 模块执行，支持相对 import（`Future<JsValue>`）
- `JsEngine.eval_file(path, options?)` — 高层封装
- `JsEngine.eval_bytes(bytes, options?)` — 高层封装
- `JsEngine.eval_path(path, options?)` — 高层封装
- `JsEngine.poll_sync_calls()` — 拉取同步回调请求（sync_bridge）
- `JsEngine.resolve_sync_call(callId, resultJson)` — 回传同步回调结果
- `JsEngine.reject_sync_call(callId, error)` — 回传同步回调错误
- `SyncCall` 类型 — JS→Dart 同步调用请求
- `rust/src/js_runtime/worker.rs` — 工作线程模块（WorkerCmd + 全局 WORKERS 注册表 + worker_loop）
- `rust/src/js_runtime/sync_bridge.rs` — 同步回调桥（全局 Mutex + Condvar，独立于 worker channel）

### 变更
- **`eval()` / `eval_with_options()` / `eval_raw()` / `eval_js_str()` 改为异步**：Dart 端返回 `Future<JsValue>`，需 `await`
- **`JsCallbackHandler` 重构**：移除 `dart:ffi` NativeCallable 依赖，改用 sync_bridge（全局 Mutex + Condvar）+ `registerSyncFunction`。API 接口不变（`register`/`eval`/`unregister` 签名相同），内部通过 Timer 自动轮询同步桥
- **线程模型变更**：`thread_local! RUNTIMES` → 全局 `WORKERS: Mutex<HashMap<u64, WorkerHandle>>`；`thread_local! COMPLETED_CALLS/PENDING_CALLS` → `worker_locals` 模块（仅在 worker 线程内访问）
- **`register_dart_handler` / `unregister_dart_handler`** → 改为 no-op（同步回调改用 sync_bridge）

### 删除
- `thread_local! RUNTIMES` — 不再使用（改为 worker 线程持有 RuntimeState）
- `thread_local! DART_HANDLERS` — 改为 no-op（sync_bridge 替代）
- `call_dart_handler()` — FFI 跨线程调用不再支持

### 修复
- 同步回调现在使用 `sync_bridge`（Mutex + Condvar），Dart Timer 轮询，不经过 worker channel 排队，实现真正的实时响应

---

## 同步 FFI 回调 (2026-06-20)

## 同步 FFI 回调 (2026-06-20)

### 新增
- `JsCallbackHandler` — 基于 `dart:ffi` `NativeCallable.isolateLocal` 的同步回调处理器，JS 调用立刻响应（无 Promise）
- `JsEngine.registerDartHandler(ptr)` — 注册 Dart FFI 回调函数指针
- `JsEngine.registerSyncFunction(name)` — 注册同步全局函数（内部使用 `create_sync_native_fn`）
- Rust↔Dart 同步 FFI 通道：`DART_HANDLERS`、`create_sync_native_fn`、`call_dart_handler`

### 修复
- `_readCString`: `Pointer<Int8>` 有符号字节值加 `& 0xFF` 转无符号（修复中文/特殊字符 UTF-8 报错）
- JSON 协议统一：改为 `serde_json::Value` 原始格式（修复 Dart↔Rust 序列化不匹配）

### 说明
- `JsCallbackHandler.register()` 使用 `registerSyncFunction`（FFI 同步回调），JS 侧 `name(args)` 直接返回结果
- Promise 模式（`registerGlobalCallable` / `registerGlobalFunction`）保留作为高级选项

---

## 重构: JS↔Dart 交互 API (2026-06-20)

### 新增
- `JsEngine.register_global_callable(name)` — 使用 Boa `context.register_global_callable()` 注册可构造+可调用的全局 JS 函数
- `JsEngine.register_global_function(name)` — 使用 `FunctionObjectBuilder` 注册不可构造的纯函数
- `JsEngine.poll_calls()` — 统一拉取所有待处理回调请求，返回 `List<CompletedCall>`
- `JsEngine.reject_call(call_id, error)` — 回传错误 reject JS Promise
- `CompletedCall` 类型 — JS→Dart 方法调用的统一请求类型（`callId` / `name` / `params`）

### 删除
- `JsEngine.post_message` / `poll_messages` / `has_messages` — 旧消息通道
- `JsEngine.register_method` / `unregister_method` / `poll_method_calls` / `resolve_call` — 旧回调系统
- `JsMessage` 类型 (Rust + Dart)
- `MethodCall` 类型 (Rust + Dart)
- `JsMethodBridge` Dart 便捷类
- `__postMessage` JS 全局函数
