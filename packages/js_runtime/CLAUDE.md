# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

Flutter FFI 插件，通过 `flutter_rust_bridge` 将 Rust 原生代码暴露给 Dart 层调用。Rust 端集成了 **Boa**（JavaScript 引擎），支持在原生层执行 JS 脚本。

## 常用命令

```bash
# 安装依赖
flutter pub get

# 静态分析
flutter analyze

# 重新生成 flutter_rust_bridge 绑定（修改 Rust API 后必须执行）
# 在 js_runtime 根目录下运行：
flutter_rust_bridge_codegen generate

# 构建 Rust 库（HarmonyOS 目标）
cd rust && cargo build --release --target aarch64-unknown-linux-ohos

# 本地调试构建（host 目标，无 cross-compile）
cd rust && cargo build
```

## 架构

```
js_runtime/
├── flutter_rust_bridge.yaml       # FRB codegen 配置（输出路径、入口类名）
├── pubspec.yaml                   # Flutter FFI 插件声明（6 平台均为 ffiPlugin: true）
├── lib/
│   ├── lib.dart                   # Barrel 导出：统一导出 src/frb/ 下所有公开 API
│   └── src/frb/                   # flutter_rust_bridge 自动生成的 Dart 代码
│       ├── frb_generated.dart     # 入口类 JsRuntimeLib + BaseEntrypoint 实现
│       ├── frb_generated.io.dart  # Native（非 Web）平台绑定
│       ├── frb_generated.web.dart # Web/WASM 平台绑定
│       └── api/hello.dart         # Rust hello() 的 Dart 封装（自动生成）
├── rust/
│   ├── Cargo.toml                 # crate: js_runtime, cdylib+staticlib, 依赖 boa_engine 0.21.1
│   └── src/
│       ├── lib.rs                 # 入口：mod frb_generated + pub mod api
│       ├── api/                   # FRB 公开 API（手写）
│       │   ├── mod.rs             # 公开 API 模块声明
│       │   ├── runtime.rs         # JsRuntime 低层 API
│       │   ├── engine.rs          # JsEngine 高层 API
│       │   ├── repl.rs            # JsRepl 交互式 REPL
│       │   ├── js_value.rs        # JsValue 枚举 + Boa 互转
│       │   ├── js_error.rs        # JsError 枚举 + 错误码
│       │   ├── eval_options.rs    # JsEvalOptions
│       │   ├── builtin_options.rs # JsBuiltinOptions + 预设
│       │   ├── module.rs          # JsModule
│       │   └── hello.rs           # 示例函数
│       ├── js_runtime/            # 内部实现（不暴露给 FRB）
│       │   ├── mod.rs
│       │   ├── internal.rs        # RuntimeState, init_context, NativeFunction 工厂
│       │   ├── worker.rs          # 工作线程：WorkerCmd + 全局 WORKERS 注册表
│       │   └── dart_callbacks.rs  # FRB dart_callback 全局注册表 + call_blocking
│       ├── dom.rs                 # DOM 解析 JS 模块（scraper）
│       ├── encoding.rs            # 字符编码转码 JS 模块（encoding_rs）
│       └── frb_generated.rs       # FRB 自动生成（勿手动编辑）
├── cargokit/                      # 跨平台 Cargo 构建胶水（CMake/Gradle/Pod）
├── ohos/                          # HarmonyOS 原生工程（CMake + cargokit）
├── android/ ios/ linux/ macos/ windows/  # 其他平台工程
└── README.md
```

## 关键配置

`flutter_rust_bridge.yaml`:
- `rust_input: crate::api,boa_engine` — 将 Rust `api` 模块和 `boa_engine` 的类型暴露给 Dart
- `dart_output: lib/src/frb` — 生成的 Dart 代码输出到 `lib/src/frb/`
- `dart_entrypoint_class_name: JsRuntimeLib` — Dart 端入口类名（原为 `RustLib`，重构后改为 `JsRuntimeLib`）

## 核心设计

1. **纯 flutter_rust_bridge**: 不再使用 `dart:ffi` 直接调用或 `ffigen` 生成绑定，所有 FFI 调用通过 `JsRuntimeLib`（flutter_rust_bridge 生成）完成
2. **Boa 集成**: Rust 端依赖 `boa_engine`，rust_input 中包含 `boa_engine`，允许 Dart 通过 FRB 调用 JS 执行相关功能
3. **入口类 `JsRuntimeLib`**: 取代旧的 `RustLib`，通过 `JsRuntimeLib.init()` 初始化，通过自动生成的 Wrapper 函数调用 Rust
4. **工作线程模型**: 每个 `JsRuntime` 拥有一个专用 OS 线程（worker），Boa Context 在 worker 内运行。`eval`/`eval_file`/`eval_bytes`/`eval_path` 等方法通过 `mpsc` channel 向 worker 发送命令，Dart 端返回 `Future`（不阻塞主 isolate）。`create()`/`dispose()`/`memory_usage()` 等轻量操作保持 `#[frb(sync)]`
5. **FRB dart_callback 回调桥**: JS↔Dart 回调使用 FRB 原生 `dart_callback: impl Fn(String) -> DartFnFuture<String>` 机制。worker 线程内创建 tokio runtime，NativeFunction 闭包中通过 `block_on` 同步等待 Dart handler 返回结果。JS 调用 `name(args)` 立刻拿到返回值，无需 Promise / `await`。
6. **JS↔Dart 回调**: 唯一入口 `JsEngine.register(name, dartCallback)`。Dart 侧传入 `(String argsJson) async => ...` 闭包，FRB 自动处理跨 FFI 通信。回调存储于全局 `dart_callbacks` 注册表（`Arc<dyn Fn(String) -> DartFnFuture<String>>`），按 `(runtime_id, name)` 索引。
7. **Eval 取消机制**: 每个 worker 持有一个代际计数器 `Arc<AtomicU64>`（`cancel_gen`）。`send_and_wait` 系列函数使用 `recv_timeout(100ms)` 轮询，若检测到代际变化则立即返回 `JsError::Cancelled`。`cancel_eval()` 递增代际计数器。由于 Boa 的 `eval()` 为同步阻塞执行，取消仅在**调用方等待侧**生效 —— worker 线程会继续完成当前 JS 执行并丢弃结果。取消后可立即发起新的 eval 调用，无需等待旧任务完成。

### Eval 取消机制详解

**Rust 侧**（`rust/src/js_runtime/worker.rs`）:
- `WorkerHandle.cancel_gen: Arc<AtomicU64>` — 代际计数器，初始值 0
- `send_and_wait*()` 记录发送命令时的代际 `start_gen`，超时轮询中检测 `cancel_gen != start_gen` 则返回 `JsError::Cancelled`
- `cancel_eval(runtime_id)` — `#[frb(sync)]`，递增代际计数器
- `JsError::Cancelled { message }` — 取消时返回的错误变体，`code()` 返回 `"CANCELLED"`

**Dart 侧使用模式** — `engine.eval()` + `cancelEval()`:
```dart
final cancelCompleter = Completer<void>();

// 发起 eval... dispose 时触发取消
ref.onDispose(() {
  if (!cancelCompleter.isCompleted) cancelCompleter.complete();
  engine.cancelEval();
  engine.close();
});
```

**JS↔Dart 回调模式**:
```dart
final engine = JsEngine.create(...);

// 注册 Dart 回调到 JS global（无 Promise，JS 直接拿到返回值）
await engine.register(
  name: 'postMessage',
  dartCallback: (String argsJson) async {
    final args = jsonDecode(argsJson) as List;
    // 处理并返回 JSON 字符串
    return jsonEncode(result);
  },
);

// JS 直接调用
await engine.eval(code: 'postMessage("hello")');
```

**错误处理** — 使用 `JsError.whenOrNull` 区分取消与真实错误:
```dart
} on JsError catch (e) {
  final isCancelled = e.whenOrNull(cancelled: (_) => true) ?? false;
  if (isCancelled) return;  // dispose 触发的正常终止，不报错
  // ... 处理其他 JsError 变体
}
```

### JS 内置模块

JS 运行时在 `init_context()` 中自动注册以下 synthetic module，可通过 `await import()` 在 JS 中直接使用：

**DOM 模块**（`rust/src/dom.rs`）:
```js
const dom = await import('dom');
dom.querySelectorAll(html, css);      // → JSON 字符串
dom.querySelector(html, css);         // → JSON 字符串 | null
dom.getElementsByTagName(html, tag);  // → JSON 字符串
dom.getElementById(html, id);         // → JSON 字符串 | null
```

**Encoding 转码模块**（`rust/src/encoding.rs`）:
```js
const enc = await import('encoding');
enc.decode([0xc4, 0xe3, 0xba, 0xc3], 'gbk');  // → "你好"
JSON.parse(enc.encode('你好', 'gbk'));          // → [196, 227, 186, 195]
enc.detect(bytes);                               // → "UTF-8" | "UTF-16LE" | "UTF-16BE" | null
JSON.parse(enc.labels());                        // → ["UTF-8", "GBK", "Big5", ...]
```

支持的编码：UTF-8、UTF-16LE、UTF-16BE、GBK、gb18030、Big5、EUC-JP、ISO-2022-JP、Shift_JIS、EUC-KR、windows-1250/1251/1252、ISO-8859-1/15、KOI8-R、IBM866 等。
底层由 `encoding_rs`（Firefox 编码库）提供，`Encoding::for_label()` 支持别名匹配（如 `gb2312` → GBK）。

**添加新 JS 模块的模式**:
1. 创建 `rust/src/xxx.rs`，实现 `pub fn register_xxx_module(context: &mut Context) -> Result<(), String>`
2. 在 `rust/src/lib.rs` 添加 `mod xxx;`
3. 在 `rust/src/js_runtime/internal.rs` 的 `init_context()` 中调用 `register_xxx_module()`
4. 模块通过 `MapModuleLoader` 注册为 synthetic module，JS 端 `await import('xxx')` 即可导入

## 修改 Rust API 流程

1. 修改 `rust/src/api/` 下的 `.rs` 文件（添加函数/结构体/enum）
2. 在 `api/mod.rs` 中声明新模块（如果是新文件）
3. 运行 `flutter_rust_bridge_codegen generate`
4. FRB 会自动更新：
   - `rust/src/frb_generated.rs`（Rust 端调度代码）
   - `lib/src/frb/api/*.dart`（Dart 端 Wrapper）
   - `lib/src/frb/frb_generated.dart`（Dart 端入口）
5. 在 `lib/lib.dart` 中添加新的 export（如果是新文件）
6. 运行 `flutter pub get` 确认解析正常
