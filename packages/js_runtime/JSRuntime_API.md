# JS 运行时 API 文档

`js_runtime` 提供嵌入式 JavaScript 运行时，基于 [Boa](https://github.com/boa-dev/boa)（纯 Rust ECMAScript 引擎），通过 `flutter_rust_bridge` 调用。参考 [FJS](https://github.com/iakii/harmonyos_ui_kit/blob/master/packages/fjs/README_zh.md) 架构设计，提供**两层 API** 和类型化的值/错误系统。

## 环境

1、添加 ohos-openssl
```bash
cd ~/.ohos/
gh repo clone ohos-rs/ohos-openssl
```

2、~/.cargo/config.toml 中配置
```toml
AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR="~/.ohos/ohos-openssl/prelude/arm64-v8a/"
ARMV7_UNKNOWN_LINUX_OHOS_OPENSSL_DIR="~/.ohos/ohos-openssl/prelude/armeabi-v7a/"
X86_64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR="~/.ohos/ohos-openssl/prelude/x86_64/"

# openssl-sys 需要 _LIB_DIR / _INCLUDE_DIR 分开的格式
AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_LIB_DIR="~/.ohos/ohos-openssl/prelude/arm64-v8a/lib"
AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_INCLUDE_DIR="~/.ohos/ohos-openssl/prelude/arm64-v8a/include"
```

---

## 架构概览

```
┌─────────────────────────────────────────────────────────┐
│                      Dart 端                            │
│  ┌────────────┐  ┌──────────────┐  ┌─────────────────┐ │
│  │ JsEngine    │  │ JsRuntime     │  │ JsCallbackHandler│ │
│  │ (高层封装)   │  │ (低层 API)    │  │ (同步回调处理器)  │ │
│  │ · eval()    │  │ · create()    │  │ · register()    │ │
│  │ · evalFile()│  │ · eval()→Fut  │  │ · eval()        │ │
│  │ · evalBytes()│ │ · evalFile()  │  │ · Timer自动轮询  │ │
│  │ · call()    │  │ · dispose()   │  └────────┬────────┘ │
│  │ · pollCalls │  │               │           │          │
│  │ · pollSync  │  │               │           │Timer轮询  │
│  └─────┬───────┘  └───────┬───────┘     sync_bridge     │
│        │                  │              (Mutex+Condvar) │
│  ┌─────┴──────────────────┴──────────────────────────┐ │
│  │  JsValue (freezed sealed) / JsError / SyncCall    │ │
│  └───────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
                  │ FRB (sync / async)
┌─────────────────┴───────────────────────────────────────┐
│                     Rust 端                              │
│  ┌──────────────────┐  ┌──────────────────────────────┐ │
│  │  Worker 线程       │  │  sync_bridge (全局 Mutex)    │ │
│  │  (每 JsRuntime 一个)│  │  · pending 调用队列          │ │
│  │  · Boa Context     │  │  · completed 响应表          │ │
│  │  · Console + Fetch │  │  · Condvar 阻塞/唤醒         │ │
│  │  · DOM Module      │  │  独立于 worker channel!      │ │
│  │  · Promise Bridge  │  └──────────────────────────────┘ │
│  │  · mpsc 命令接收    │                                  │
│  └──────────────────┘                                    │
└─────────────────────────────────────────────────────────┘
```

**两层 API 设计**：
- **JsRuntime**（低层）：灵活控制运行时生命周期
- **JsEngine**（高层）：封装运行时管理，提供 `call()`、`register_*`、回调处理等
- **JsCallbackHandler**：基于 sync_bridge 的真正同步回调（JS 调用立刻响应）

**线程模型**：
- 每个 `JsRuntime` 拥有一个**专用 OS 线程**（worker）
- eval/文件/字节 等方法通过 `mpsc` channel 向 worker 发送命令，Dart 端返回 `Future`
- `pollSyncCalls()`/`resolveSyncCall()` 等同步桥方法为 `#[frb(sync)]`，直接访问全局 Mutex，不经过 worker channel

---

## Dart API

### 导入

```dart
import 'package:js_runtime/lib.dart';
```

### JsValue —— 类型化的 JS 值

所有 `eval()` 返回 `JsValue`（freezed sealed class），支持 Dart 3 `switch` 模式匹配：

```dart
JsValue result = await rt.eval(code: '42');

// 模式匹配
switch (result) {
  case JsValue_Integer(:final field0):
    print('整数: $field0');
  case JsValue_String_(:final field0):
    print('字符串: $field0');
  case JsValue_Array(:final field0):
    print('数组: ${field0.length} 项');
  default:
    print('类型: ${result.typeName()}');
}
```

**JsValue 变体**：

| 变体 | Dart 类型 | 说明 |
|------|----------|------|
| `JsValue_None` | — | `null` 或 `undefined` |
| `JsValue_Boolean` | `bool` | 布尔值 |
| `JsValue_Integer` | `PlatformInt64` | 整数 |
| `JsValue_Float` | `double` | 浮点数 |
| `JsValue_BigInt` | `String` | BigInt（字符串表示） |
| `JsValue_String_` | `String` | 字符串 |
| `JsValue_Bytes` | `Uint8List` | 二进制数据 |
| `JsValue_Array` | `List<JsValue>` | 数组 |
| `JsValue_Object` | `List<(String, JsValue)>` | 对象（键值对） |
| `JsValue_Date` | `PlatformInt64` | Unix 毫秒时间戳 |
| `JsValue_Symbol` | `String` | Symbol 描述 |

**便利扩展**（`JsValueExt`）：

```dart
// 同步类型判断（无需 await）
result.isNone       // bool
result.isNumber     // bool
result.isString     // bool
result.isArray      // bool

// 同步取值
result.asBooleanSync     // bool?
result.asIntegerSync     // PlatformInt64?
result.asStringSync      // String?
result.asArraySync       // List<JsValue>?
result.asMapSync         // Map<String, JsValue>?
result.asNumberSync      // double?
```

**工厂构造器**：

```dart
JsValue.none()
JsValue.boolean(true)
JsValue.integer(PlatformInt64.from(42))
JsValue.float(3.14)
JsValue.string("hello")
JsValue.bigInt("9007199254740993n")
JsValue.array([JsValue.integer(1), JsValue.integer(2)])
JsValue.object([("key", JsValue.string("value"))])
```

---

### JsError —— 结构化错误

`eval()` 等方法失败时抛出 `JsError`（freezed sealed class，实现 `FrbException`）：

```dart
try {
  await rt.eval(code: '{{{{');
} on JsError catch (e) {
  switch (e) {
    case JsError_Syntax(:final message, :final line, :final column):
      print('语法错误 第${line}行: $message');
    case JsError_Type(:final message):
      print('类型错误: $message');
    case JsError_MemoryLimit(:final message):
      print('内存超限: $message');
    default:
      print('[${e.code()}] $e');
  }
}
```

**JsError 变体与错误码**：

| 变体 | 错误码 | 说明 |
|------|--------|------|
| `JsError_Syntax` | `SYNTAX` | 语法错误（含 line/column） |
| `JsError_Type` | `TYPE` | 类型错误 |
| `JsError_Reference` | `REFERENCE` | 引用错误（未定义变量） |
| `JsError_Runtime` | `RUNTIME` | 运行时错误 |
| `JsError_MemoryLimit` | `MEMORY_LIMIT` | 内存超限 |
| `JsError_StackOverflow` | `STACK_OVERFLOW` | 栈溢出 |
| `JsError_Internal` | `INTERNAL` | 内部/桥接错误 |
| `JsError_Generic` | `GENERIC` | 通用错误（兜底） |

---

### JsRuntime —— 低层 API

#### 创建运行时

```dart
// 默认配置（essential 内置模块，无内存限制）
final rt = JsRuntime.create();

// 自定义配置
final rt = JsRuntime.create(
  options: JsRuntimeOptions(
    memoryLimit: BigInt.from(100 * 1024 * 1024),  // 100MB 上限
    info: "my-runtime",                             // 调试标识
    builtins: JsBuiltinOptions.web(),               // 内置模块预设
  ),
);

// 旧版兼容（简单参数）
final rt = JsRuntime.createLegacy(
  maxMemoryBytes: BigInt.from(50 * 1024 * 1024),
);
```

#### 执行 JS 代码

```dart
// 执行 JS —— 返回 Future<JsValue>（在后台工作线程执行）
JsValue result = await rt.eval(code: '40 + 2');
print(result.asIntegerSync);  // 42

// 从文件执行 JS
JsValue result = await rt.evalFile(
  path: '/path/to/script.js',
  options: JsEvalOptions(strict: true),
);

// 从字节数组执行 JS（UTF-8）
JsValue result = await rt.evalBytes(
  bytes: utf8.encode('1 + 2'),
);

// 从文件路径作为 ES 模块执行（支持相对 import）
JsValue result = await rt.evalPath(
  path: '/path/to/module.js',
);

// 带选项执行
JsValue result = await rt.evalWithOptions(
  code: 'var x = 1; x',
  options: JsEvalOptions(strict: true),
);

// 旧版兼容：返回字符串
String text = await rt.evalJsStr(code: '40 + 2');  // "42"
```

#### 语法校验（不执行）

```dart
// 校验 script 语法（static，同步）
try {
  JsRuntime.validate(code: 'var x = ;');  // 语法错误
} on JsError catch (e) {
  switch (e) {
    case JsError_Syntax(:final message, :final line, :final column):
      print('第${line}行第${column}列: $message');
    default: break;
  }
}

// 校验模块语法
JsRuntime.validateModule(name: 'math', source: '''
  export function add(a, b) { return a + b; }
''');
```

#### 模块管理

```dart
rt.preloadModule(name: 'math', source: '''
  export function add(a, b) { return a + b; }
  export const VERSION = '1.0';
''');

await rt.eval(code: '''
  (async () => {
    const math = await import('math');
    return math.add(3, 4);
  })()
''');
```

#### 内存管理

```dart
rt.memoryUsage();               // 估算内存（字节）
JsRuntime.totalMemoryUsage();   // 进程 RSS（Linux/HarmonyOS）
rt.setMemoryLimit(BigInt.from(50 * 1024 * 1024));
rt.runGc();                     // 触发 GC
rt.releaseMemory();             // 同 runGc()
```

#### 生命周期

```dart
rt.dispose();  // 销毁运行时 + 关闭 worker 线程
```

**JsRuntime 完整方法列表**：

| 方法 | 返回 | 同步/异步 | 说明 |
|------|------|----------|------|
| `create({options})` | `JsRuntime` | sync | 创建运行时 |
| `createLegacy({maxMemoryBytes})` | `JsRuntime` | sync | 创建运行时（旧版兼容） |
| `eval({code})` | `Future<JsValue>` | **async** | 执行 JS（后台工作线程） |
| `evalWithOptions({code, options})` | `Future<JsValue>` | **async** | 带选项执行 |
| `evalFile({path, options})` | `Future<JsValue>` | **async** | 读取文件执行 JS |
| `evalBytes({bytes, options})` | `Future<JsValue>` | **async** | 从字节数组执行 JS（UTF-8） |
| `evalPath({path, options})` | `Future<JsValue>` | **async** | 读取文件作为 ES 模块执行 |
| `evalJsStr({code})` | `Future<String>` | **async** | 执行 JS，返回字符串（旧版兼容） |
| `validate({code})` | `void` | sync (static) | 纯语法校验（不执行） |
| `validateModule({name, source})` | `void` | sync (static) | 模块语法校验 |
| `preloadModule({name, source})` | `void` | sync | 预加载 ES 模块 |
| `memoryUsage()` | `BigInt` | sync | 估算内存用量 |
| `totalMemoryUsage()` | `BigInt` | sync (static) | 进程物理内存 |
| `setMemoryLimit({limitBytes})` | `void` | sync | 设置内存上限 |
| `runGc()` | `void` | sync | 触发 GC |
| `releaseMemory()` | `void` | sync | 同 runGc() |
| `dispose()` | `void` | sync | 销毁运行时 |

> **异步方法**（`eval`, `evalFile`, `evalBytes`, `evalPath`, `evalJsStr`）在后台工作线程执行，Dart 端返回 `Future`，不阻塞主 isolate。其他轻量方法保持同步。

---

### JsEngine —— 高层 API

```dart
final engine = JsEngine.create(
  builtins: JsBuiltinOptions.web(),
  modules: [
    JsModule(name: 'math', source: '''
      export function add(a, b) { return a + b; }
    '''),
  ],
  runtimeOptions: JsRuntimeOptions(
    memoryLimit: BigInt.from(100 * 1024 * 1024),
  ),
);

// 执行 JS（async）
JsValue result = await engine.eval(code: '1 + 2');

// 从文件 / 字节 / 路径执行（均为 async）
await engine.evalFile(path: '/path/to/script.js');
await engine.evalBytes(bytes: utf8.encode('1 + 2'));
await engine.evalPath(path: '/path/to/module.js');

// 调用模块函数（async）
JsValue sum = await engine.call(
  module: 'math',
  method: 'add',
  params: [JsValue.integer(3), JsValue.integer(4)],
);

// 注册模块
engine.declareModule(JsModule(name: 'utils', source: '...'));

// JS→Dart 同步回调（通过 sync_bridge）
engine.registerSyncFunction(name: 'compute');
// 见 JsCallbackHandler 推荐用法

// 内存管理
engine.memoryUsage();
engine.runGc();

// 关闭
engine.close();
```

**JsEngine 方法列表**：

| 方法 | 返回 | 同步/异步 | 说明 |
|------|------|----------|------|
| `create({builtins, modules, runtimeOptions})` | `JsEngine` | sync | 创建引擎 |
| `eval({code})` | `Future<JsValue>` | **async** | 执行 JS |
| `evalWithOptions({code, options})` | `Future<JsValue>` | **async** | 带选项执行 |
| `evalRaw({code})` | `Future<JsValue>` | **async** | 执行 JS（不 resolve 顶层 Promise） |
| `evalFile({path, options})` | `Future<JsValue>` | **async** | 读取文件执行 JS |
| `evalBytes({bytes, options})` | `Future<JsValue>` | **async** | 从字节数组执行 JS |
| `evalPath({path, options})` | `Future<JsValue>` | **async** | 读取文件作为 ES 模块执行 |
| `call({module, method, params})` | `Future<JsValue>` | **async** | 调用模块导出函数 |
| `declareModule({module})` | `void` | sync | 注册单个模块 |
| `declareModules({modules})` | `void` | sync | 批量注册模块 |
| `registerGlobalCallable({name})` | `void` | sync | 注册可构造 Promise 函数 |
| `registerGlobalFunction({name})` | `void` | sync | 注册纯 Promise 函数 |
| `registerDartHandler({ptr})` | `void` | sync | （已弃用）注册 FFI 指针 |
| `registerSyncFunction({name})` | `void` | sync | 注册同步函数（sync_bridge） |
| `pollCalls()` | `List<CompletedCall>` | sync | 拉取 Promise 回调请求 |
| `resolveCall({callId, result})` | `void` | sync | resolve JS Promise |
| `rejectCall({callId, error})` | `void` | sync | reject JS Promise |
| `pollSyncCalls()` | `List<SyncCall>` | sync | 拉取同步桥回调请求 |
| `resolveSyncCall({callId, resultJson})` | `void` | sync | 回传同步回调结果 |
| `rejectSyncCall({callId, error})` | `void` | sync | 回传同步回调错误 |
| `runJobs()` | `void` | sync | 执行微任务 |
| `memoryUsage()` | `BigInt` | sync | 内存用量 |
| `runGc()` | `void` | sync | 触发 GC |
| `setMemoryLimit({limitBytes})` | `void` | sync | 设置内存上限 |
| `close()` | `void` | sync | 关闭引擎 |

---

## Dart↔JS 方法调用

### JsCallbackHandler（推荐）

`JsCallbackHandler` 基于 `sync_bridge`（全局 Mutex + Condvar）实现**真正同步**的 JS→Dart 回调——JS 调用立刻执行 Dart handler 并返回结果。Dart 端通过 Timer 定时轮询，每 1ms 检查一次同步桥。

```dart
import 'package:js_runtime/lib.dart';

final engine = JsEngine.create();
final handler = JsCallbackHandler(engine);

// 注册 —— JS 调用时立刻同步响应
handler.register('sum', (args) {
  return JsValue.integer(args[0].asIntegerSync! + args[1].asIntegerSync!);
});

handler.register('postMessage', (args) {
  print('实时: [${args[0].asStringSync}] ${args[1]}');
  return JsValue.none();
});

// JS 端直接拿到结果，无需 await！
final result = await handler.eval('sum(3, 4) + 10');
print(result.asIntegerSync);  // 17

// 实时进度通知
await handler.eval('''
  for (var i = 0; i < 10; i++) {
    postMessage("progress", "step " + i);  // Dart handler 立刻执行
  }
''');
```

#### 工作原理

```
JS 调用 sum(3, 4)
  → Worker 线程: Boa NativeFunction（同步）
    → 序列化 args → JSON
    → sync_bridge::worker_send_and_wait(name, args_json)
      → 写入 pending 队列
      → condvar.wait() 阻塞 ←──┐
                               │
Dart Timer (每 1ms):           │
  → engine.pollSyncCalls() ← sync_bridge（不排队） │
  → 执行 handler → 返回 result                     │
  → engine.resolveSyncCall(callId, resultJson)     │
  → condvar.notify_all() 唤醒 ─────────────────────┘
  
Worker 被唤醒 → 返回 result 给 JS → JS 继续执行
```

注册的同步方法在 JS 执行期间**立刻响应**（和 `console.log` 等内置函数一样同步执行）。

#### JsCallbackHandler API

| 方法 | 说明 |
|------|------|
| `register(name, handler)` | 注册同步回调（JS 调用立刻响应，无 Promise） |
| `unregister(name)` | 注销已注册的回调 |
| `eval(code)` | 执行 JS 并返回结果（启动 Timer 自动轮询同步桥） |
| `registeredMethods` | 已注册的方法名列表 |
| `isRegistered(name)` | 检查是否已注册 |
| `engine` | 获取底层 `JsEngine` 实例 |

---

### Promise 回调机制（高级）

### 工作流程

```
Dart                              Rust                          JS
─────                             ────                          ──
engine.registerGlobalFunction("sum")
  → internal::create_native_fn()  → NativeFunction 创建
  → FunctionObjectBuilder          → 构建不可构造的 JsFunction
  → define_property_or_throw       → 绑定到 globalThis.sum
                                          ↓
engine.evalRaw(code)                      sum(3, 4)
  → ctx.eval(Source)                        → Promise 创建
                                            → {callId, "sum", [3,4]} 入队
engine.pollCalls()
  ← CompletedCall(callId, "sum", [3,4])
engine.resolveCall(callId, result)  ──→  Promise resolve(value)
engine.runJobs()                     ──→  .then(r => ...) 执行
```

> **重要**：JS 使用 `.then()` 模式，**不要**用顶层 `await`。`eval()` 内部会 `await_blocking` 顶层 Promise 导致死锁。

### CompletedCall 类型

```dart
class CompletedCall {
  final BigInt callId;        // 唯一 ID，用于 resolve / reject
  final String name;          // 注册的方法名
  final List<JsValue> params; // 调用参数
}
```

### register_global_callable vs register_global_function

| 特性 | `register_global_callable` | `register_global_function` |
|------|---------------------------|---------------------------|
| Boa API | `context.register_global_callable()` | `FunctionObjectBuilder` + 手动绑定 |
| JS 调用 | `name(args)` ✅ | `name(args)` ✅ |
| JS 构造 | `new name(args)` ✅ | `new name(args)` ❌ TypeError |
| Promise 机制 | ✅ 共用 poll/resolve/reject | ✅ 共用 poll/resolve/reject |
| 适用场景 | 类/构造函数、需要 `new` 的 API | 纯函数、工具方法 |

---

### JsBuiltinOptions —— 内置模块配置

```dart
JsBuiltinOptions.none();       // 无内置模块
JsBuiltinOptions.essential();  // Console（默认）
JsBuiltinOptions.web();       // Console + Fetch
JsBuiltinOptions.all();       // 同 web()
```

### JsEvalOptions —— 执行选项

```dart
JsEvalOptions.defaults();            // 默认
JsEvalOptions(strict: true);        // 启用严格模式
JsEvalOptions.strictMode();         // 同 strict: true
```

### JsModule —— 模块定义

```dart
JsModule(name: 'my-module', source: 'export const x = 1;');
```

---

## 内置 Web API

### Console（默认启用）

| 方法 | 说明 |
|------|------|
| `console.log(...args)` | 标准输出 |
| `console.error(...args)` | 标准错误 |
| `console.warn(...args)` | 标准输出（前缀 `[JS Warn]`） |
| `console.info(...args)` | 标准输出 |
| `console.debug(...args)` | 标准输出 |
| `console.trace(...args)` | 带调用栈的标准输出 |

### Fetch（JsBuiltinOptions.web() 启用）

```js
var r = await fetch('https://example.com/api');
var data = await r.json();
console.log(r.status, r.ok);
```

- 使用 `reqwest` **同步阻塞** HTTP 客户端
- 支持 `GET`、`POST`、自定义 headers、body 等

### Intl 国际化（启用 `intl_bundled` feature）

```js
new Intl.DateTimeFormat('zh-CN').format(new Date());   // "2026/6/19"
new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(1234.56);
'ä'.localeCompare('z', 'de');  // -1
```

### 定时器（始终启用）

```js
setTimeout(() => console.log('later'), 1000);
```

### 垃圾回收

```dart
rt.runGc();          // 完整 GC：force_collect() + clear_kept_objects() + 重置代码估算
rt.releaseMemory();  // 同 runGc()
```

---

## REPL 交互式求值

```dart
final repl = JsRepl.create();

var result = repl.evalLine(line: 'var x = 1;');
print(result.output);     // "1"

repl.evalLine(line: 'function foo() {');
repl.evalLine(line: '  return 42;');
result = repl.evalLine(line: '}');  // 执行整个函数

repl.close();
```

---

## DOM 解析模块

```js
const dom = await import('dom');
const elements = JSON.parse(dom.querySelectorAll(html, '.foo p'));
console.log(elements[0].tagName);   // "p"
console.log(elements[0].text);      // 文本内容
```

---

## 完整示例

### 示例 1：基础使用

```dart
final rt = JsRuntime.create(
  options: JsRuntimeOptions(memoryLimit: BigInt.from(50 * 1024 * 1024)),
);

JsValue result = await rt.eval(code: '40 + 2');
print(result.asIntegerSync);  // 42

JsValue obj = await rt.eval(code: '({name: "test", count: 5})');
Map<String, JsValue>? map = obj.asMapSync;
print(map?['name']?.asStringSync);  // "test"

rt.dispose();
```

### 示例 2：从文件执行

```dart
final rt = JsRuntime.create();

// 从文件执行
JsValue result = await rt.evalFile(path: '/path/to/script.js');

// 从字节数组执行
JsValue result = await rt.evalBytes(bytes: utf8.encode('1 + 2'));

// 作为 ES 模块执行（支持相对 import）
JsValue result = await rt.evalPath(path: '/path/to/module.js');

rt.dispose();
```

### 示例 3：JsEngine + 模块调用

```dart
final engine = JsEngine.create(
  builtins: JsBuiltinOptions.web(),
  modules: [
    JsModule(name: 'geo', source: '''
      export function circleArea(r) { return Math.PI * r * r; }
    '''),
  ],
);

JsValue area = await engine.call(
  module: 'geo',
  method: 'circleArea',
  params: [JsValue.float(5.0)],
);
print(area.asFloatSync);  // 78.5398...

engine.close();
```

### 示例 4：JsCallbackHandler 同步回调

```dart
final engine = JsEngine.create(builtins: JsBuiltinOptions.web());
final handler = JsCallbackHandler(engine);

handler.register('sum', (args) {
  return JsValue.integer(args[0].asIntegerSync! + args[1].asIntegerSync!);
});

handler.register('postMessage', (args) {
  print('实时进度: [${args[0].asStringSync}] ${args[1]}');
  return JsValue.none();
});

// JS 中 sum 立刻返回，postMessage 实时通知
await handler.eval('''
  postMessage("info", JSON.stringify({ total: sum(10, 20) }));
''');

engine.close();
```

---

## 迁移指南（旧 API → 新 API）

| 旧 API | 新 API |
|--------|--------|
| `rt.eval(code)` → `JsValue`（同步） | `await rt.eval(code:)` → `Future<JsValue>`（异步） |
| `rt.evalJs(code)` → `String`（同步） | `await rt.evalJsStr(code:)` → `Future<String>`（异步） |
| — | `await rt.evalFile(path:, options?)` 新增 |
| — | `await rt.evalBytes(bytes:, options?)` 新增 |
| — | `await rt.evalPath(path:, options?)` 新增 |
| `JsCallbackHandler` 基于 `dart:ffi` NativeCallable | `JsCallbackHandler` 基于 sync_bridge（API 相同，无需改代码） |
| 无 `SyncCall` / `pollSyncCalls` | 新增同步桥 API（通常通过 JsCallbackHandler 使用） |

---

## 架构说明

### 线程模型

```
Dart Main Isolate
    │
    ├── eval()/evalFile()/... → FRB worker 线程 → mpsc → JS worker 线程
    │   (Dart 端返回 Future，不阻塞)
    │
    ├── pollSyncCalls()/resolveSyncCall() → 直接访问 sync_bridge (Mutex)
    │   (#[frb(sync)]，Dart 主线程执行，不排队)
    │
    └── create()/dispose()/memoryUsage()/... → 轻量操作保持同步
```

### 模块结构

```
rust/src/api/          （FRB 公开 API）
├── js_value.rs        JsValue 枚举 + Boa 互转
├── js_error.rs        JsError 枚举 + 错误码
├── runtime.rs         JsRuntime 低层 API
├── engine.rs          JsEngine 高层封装（含回调注册 + sync_bridge API）
├── repl.rs            JsRepl 交互式 REPL
├── eval_options.rs    JsEvalOptions
├── builtin_options.rs JsBuiltinOptions + 预设
├── module.rs          JsModule
└── hello.rs           示例函数

rust/src/js_runtime/   （内部实现，不暴露给 Dart）
├── internal.rs        RuntimeState, init_context, NativeFunction 工厂
├── worker.rs          工作线程：WorkerCmd + 全局 WORKERS 注册表 + worker_loop
└── sync_bridge.rs     同步回调桥：全局 Mutex+Condvar
```

---

## 限制与注意事项

| 限制 | 说明 |
|------|------|
| **异步 eval** | `eval`/`evalFile`/`evalBytes`/`evalPath` 返回 `Future`，需 `await` |
| **同步回调限制** | sync_bridge 需要 Dart Timer 轮询，有 ~1ms 延迟 |
| **无顶层 await** | `eval()` 以 script 模式执行，顶层 `await` 需包裹在 async IIFE 中 |
| **静态 import** | 仅支持动态 `import()`，不支持顶层 `import ... from` |
| **DOM API** | 仅查询（read-only），无 `createElement`、事件系统等 |
| **CORS** | `fetch` 无跨域限制（原生 HTTP 客户端） |
| **WebSocket** | 不支持 |
| **localStorage** | 不支持（可通过预加载模块自行实现） |
| **内存泄漏** | 未调用 `dispose()`/`close()` 会导致运行时泄漏 |
