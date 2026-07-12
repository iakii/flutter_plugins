# Plan: JS Eval 移至 FRB 子线程 + 新增 eval_file/bytes/path 方法

## Context

当前所有 JS eval 方法都标注了 `#[frb(sync)]`，意味着 JS 代码执行（包括可能耗时的 `setTimeout`、HTTP fetch、大脚本）会**阻塞 Dart 主 isolate**。用户希望将 eval 逻辑移入后台线程执行，释放 Dart 主线程。

### 核心约束
- `boa_engine::Context` **不是** `Send + Sync`（内部含 `Rc`、`Gc`、`RefCell`），无法在任意线程间共享
- 当前所有状态存储在 `thread_local!` 中，是完全单线程架构

### 解决方案
**Dedicated Thread per Runtime（Actor 模式）**：每个 `JsRuntime` 拥有一个专用 OS 线程，线程内持有 `Context`。所有操作通过 `mpsc` channel 发送命令，在工作线程中执行，结果通过 `oneshot` channel 返回。

---

## 修改文件清单

### 1. 新建 `rust/src/js_runtime/worker.rs` — 工作线程核心

定义：
- `WorkerCmd` 枚举：所有可向工作线程发送的命令
- `WorkerHandle` 结构体：持有 `Sender<WorkerCmd>` + `JoinHandle<()>`
- `spawn_worker()` 函数：创建线程、初始化 Context、进入命令处理循环
- 全局 `WORKERS: Lazy<Mutex<HashMap<u64, WorkerHandle>>>`

`WorkerCmd` 覆盖所有需要访问 Context 的操作：
```rust
enum WorkerCmd {
    Eval { code: String, options: JsEvalOptions, reply: Oneshot<Result<JsValue, JsError>> },
    EvalRaw { code: String, reply: Oneshot<Result<JsValue, JsError>> },
    EvalFile { path: String, options: JsEvalOptions, reply: Oneshot<Result<JsValue, JsError>> },
    EvalBytes { bytes: Vec<u8>, options: JsEvalOptions, reply: Oneshot<Result<JsValue, JsError>> },
    EvalPath { path: String, options: JsEvalOptions, reply: Oneshot<Result<JsValue, JsError>> },
    PreloadModule { name: String, source: String, reply: Oneshot<Result<(), JsError>> },
    Call { module: String, method: String, params: Vec<JsValue>, reply: Oneshot<Result<JsValue, JsError>> },
    RegisterGlobalCallable { name: String, reply: Oneshot<Result<(), JsError>> },
    RegisterGlobalFunction { name: String, reply: Oneshot<Result<(), JsError>> },
    RegisterSyncFunction { name: String, reply: Oneshot<Result<(), JsError>> },
    PollCalls { reply: Oneshot<Vec<CompletedCall>> },
    ResolveCall { call_id: u64, result: JsValue, reply: Oneshot<Result<(), JsError>> },
    RejectCall { call_id: u64, error: String, reply: Oneshot<Result<(), JsError>> },
    RunJobs,
    RunGc,
    MemoryUsage { reply: Oneshot<u64> },
    SetMemoryLimit { limit_bytes: u64 },
    EvalJsStr { code: String, reply: Oneshot<Result<String, String>> },
    Dispose { reply: Oneshot<Result<(), JsError>> },
}
```

工作线程内部维护：
- `context: Context`
- `completed_calls: Vec<CompletedCall>`（原 thread_local）
- `pending_calls: HashMap<u64, PendingCall>`（原 thread_local）
- `estimated_memory`, `total_code_bytes`, `total_module_bytes`, `max_memory`
- 通过全局 `DART_HANDLERS`（改为 `Mutex`）访问 FFI 回调指针

### 2. 修改 `rust/src/js_runtime/internal.rs` — 重构全局状态

**删除：**
- `thread_local! RUNTIMES` — 移至 worker 线程内部
- `thread_local! COMPLETED_CALLS` — 移至 worker 线程内部
- `thread_local! PENDING_CALLS` — 移至 worker 线程内部

**修改：**
- `thread_local! DART_HANDLERS` → `static DART_HANDLERS: Lazy<Mutex<HashMap<u64, DartCallHandler>>>`
  - `register_dart_handler()` 改为获取 Mutex 锁写入
  - `unregister_dart_handler()` 改为获取 Mutex 锁删除
  - `call_dart_handler()` 改为获取 Mutex 锁读取

**保留不变：**
- `next_id()` / `next_call_id()` — AtomicU64 已线程安全
- `init_context()` — 由 worker 线程调用
- `register_web_apis()`, `register_timers()` — 由 worker 线程调用
- `parse_module()`, `get_module_loader()` — 由 worker 线程调用
- `eval_and_resolve()` — 由 worker 线程调用
- `check_memory_limit()` — 由 worker 线程调用
- `frb_value_to_json()` / `json_to_frb_value()` — 纯函数，不变
- `create_native_fn()` — 由 worker 线程调用（闭包内访问的 COMPLETED_CALLS/PENDING_CALLS 现在在 worker 的局部变量中）
- `create_sync_native_fn()` — 由 worker 线程调用（闭包内通过全局 DART_HANDLERS Mutex 访问 FFI 指针）

**注意：** `create_native_fn` 和 `create_sync_native_fn` 闭包捕获的数据需要调整。原来闭包内访问 `thread_local!`，现在需要访问 worker 线程局部状态或全局 Mutex。采用方案：
- `create_native_fn` 接收 `Sender<WorkerCmd>` 的克隆，闭包内向自己发送 `PollCalls` 等命令（或直接操作 worker 内部的 `completed_calls`/`pending_calls` 局部变量）
- 更简单：worker 线程在注册时将自身的 `Rc<RefCell<WorkerLocalState>>` 传入闭包

### 3. 修改 `rust/src/js_runtime/mod.rs`

添加 `pub(crate) mod worker;`

### 4. 修改 `rust/src/api/runtime.rs` — JsRuntime API 层

**创建阶段：**
- `create()` 调用 `worker::spawn_worker()` 启动工作线程，存储 `WorkerHandle` 到全局 `WORKERS`
- 保留 `#[frb(sync)]`（创建很快，不阻塞）

**Eval 方法 — 移除 `#[frb(sync)]`，变为异步：**
- `eval()`, `eval_with_options()`, `eval_js_str()` — 发送 `WorkerCmd::Eval` 等，等待 oneshot 回复
- 新增：
  - `eval_file(path: String, options: Option<JsEvalOptions>)` — 发送 `WorkerCmd::EvalFile`
  - `eval_bytes(bytes: Vec<u8>, options: Option<JsEvalOptions>)` — 发送 `WorkerCmd::EvalBytes`
  - `eval_path(path: String, options: Option<JsEvalOptions>)` — 发送 `WorkerCmd::EvalPath`

**其他方法 — 通过 channel 发送命令：**
- `preload_module()`, `memory_usage()`, `set_memory_limit()`, `run_gc()`, `release_memory()`, `dispose()`
- 这些可以保留 `#[frb(sync)]`（操作简单，不耗时），但内部通过 channel 与 worker 通信

**eval_file / eval_bytes / eval_path 语义：**
- `eval_file(path)` — 读取文件内容，作为 Script eval
- `eval_bytes(bytes)` — 将 bytes 按 UTF-8 解码后 eval
- `eval_path(path)` — 读取文件，并将文件所在目录设置为模块解析基路径，作为 Module eval（支持相对 import）

### 5. 修改 `rust/src/api/engine.rs` — JsEngine API 层

**创建阶段：**
- `create()` 改为通过 channel 创建（先 spawn worker，再通过 channel 注册模块）
- 或：保留 `#[frb(sync)]`，内部调用 `JsRuntime::create()` + 通过 channel 发送 `PreloadModule`

**Eval 方法 — 移除 `#[frb(sync)]`：**
- `eval()`, `eval_raw()`, `eval_with_options()` — 移除 `#[frb(sync)]`，委托给 JsRuntime
- 新增 `eval_file()`, `eval_bytes()`, `eval_path()` 委托方法

**回调相关方法：**
- `poll_calls()`, `resolve_call()`, `reject_call()` — 通过 channel 与 worker 通信
- `register_global_callable()`, `register_global_function()`, `register_sync_function()` — 通过 channel
- `register_dart_handler()` — 直接操作全局 `DART_HANDLERS` Mutex（不通过 worker）

### 6. 修改 `rust/src/api/repl.rs` — JsRepl（如果存在）

REPL 也依赖 `RUNTIMES` thread-local，需要改为通过 channel 通信或拥有自己的 worker 线程。但考虑到 REPL 通常是交互式的，可以保持现状或后续再改。

**决定：REPL 暂时保持 `#[frb(sync)]`，直接在当前线程创建独立 Context（不复用 engine/runtime 的 worker）**

---

## eval_file / eval_bytes / eval_path 详细设计

```rust
// runtime.rs 新增方法

/// 从文件路径读取 JS 代码并执行。
/// 返回类型化的 JsValue。
pub fn eval_file(&self, path: String, options: Option<JsEvalOptions>) -> Result<JsValue, JsError> {
    let (tx, rx) = oneshot::channel();
    send_cmd(&self.id, WorkerCmd::EvalFile { 
        path, 
        options: options.unwrap_or_default(), 
        reply: tx 
    })?;
    rx.recv().map_err(|_| JsError::internal("Worker thread died"))?
}

/// 从字节数组执行 JS 代码（UTF-8 编码）。
pub fn eval_bytes(&self, bytes: Vec<u8>, options: Option<JsEvalOptions>) -> Result<JsValue, JsError> {
    let (tx, rx) = oneshot::channel();
    send_cmd(&self.id, WorkerCmd::EvalBytes { 
        bytes, 
        options: options.unwrap_or_default(), 
        reply: tx 
    })?;
    rx.recv().map_err(|_| JsError::internal("Worker thread died"))?
}

/// 将文件作为 ES 模块执行（支持相对路径 import）。
/// 文件所在目录作为模块解析的基础路径。
pub fn eval_path(&self, path: String, options: Option<JsEvalOptions>) -> Result<JsValue, JsError> {
    let (tx, rx) = oneshot::channel();
    send_cmd(&self.id, WorkerCmd::EvalPath { 
        path, 
        options: options.unwrap_or_default(), 
        reply: tx 
    })?;
    rx.recv().map_err(|_| JsError::internal("Worker thread died"))?
}
```

Worker 线程中对应的处理：
```rust
WorkerCmd::EvalFile { path, options, reply } => {
    let result = (|| {
        let code = std::fs::read_to_string(&path)
            .map_err(|e| JsError::internal(format!("Cannot read file '{path}': {e}")))?;
        eval_in_worker(&mut ctx, &code, &options, &mut memory)
    })();
    let _ = reply.send(result);
}
WorkerCmd::EvalBytes { bytes, options, reply } => {
    let result = (|| {
        let code = String::from_utf8(bytes)
            .map_err(|e| JsError::internal(format!("Invalid UTF-8: {e}")))?;
        eval_in_worker(&mut ctx, &code, &options, &mut memory)
    })();
    let _ = reply.send(result);
}
WorkerCmd::EvalPath { path, options, reply } => {
    let result = (|| {
        let code = std::fs::read_to_string(&path)
            .map_err(|e| JsError::internal(format!("Cannot read file '{path}': {e}")))?;
        // TODO: 设置模块基础路径为文件所在目录
        eval_in_worker(&mut ctx, &code, &options, &mut memory)
    })();
    let _ = reply.send(result);
}
```

---

## FRB 代码生成影响

修改 Rust API 后需运行：
```bash
cd packages/js_runtime && flutter_rust_bridge_codegen generate
```

生成变化：
- 移除 `#[frb(sync)]` 的方法 → Dart 端从同步方法变为返回 `Future`
- 新增的 `eval_file`/`eval_bytes`/`eval_path` → Dart 端生成对应的 `Future` 方法
- `lib/lib.dart` 需添加新的 export（如有新文件）

---

## 向后兼容性

- Dart 调用方需从 `engine.eval(code:)` 改为 `await engine.eval(code:)`
- 现有的 `gallery_page.dart`、`js_parse.dart`、各 provider 文件需添加 `await`
- `JsCallbackHandler.eval()`（手写 Dart）也需要适配

---

## 验证步骤

1. `cargo build` — Rust 编译通过
2. `flutter_rust_bridge_codegen generate` — FRB 代码生成成功
3. `flutter pub get` — Dart 依赖解析成功
4. `flutter analyze` — 静态分析无错误
5. 检查生成的 Dart API 文件确认方法签名正确
