# Clipboard Listener Plugin

## 介绍 (Introduction)

`clipboard_listener` 是一款面向 Flutter 桌面应用的插件，用于监听剪贴板内容的变化。该插件支持 Windows, macOS 和 Linux 平台。同时，该插件依赖于 `flutter_rust_lib_core`，并通过 `flutter_rust_bridge` 实现 Flutter 和 Rust 之间的交互。

`clipboard_listener` is a Flutter plugin designed for desktop applications to listen for clipboard content changes. This plugin supports Windows, macOS, and Linux. It also depends on `flutter_rust_lib_core` and uses `flutter_rust_bridge` to enable interaction between Flutter and Rust.

---

## 安装 (Installation)

通过 Git 使用此插件：

Install the plugin via Git:

```yaml
# 在 pubspec.yaml 文件中添加以下内容
# Add the following to your pubspec.yaml file
dependencies:
  clipboard_listener:
    git:
      url: https://github.com/iakii/flutter_plugins.git
      path: packages/clipboard_listener
```

然后执行以下命令安装依赖：

Then run the following command to install dependencies:

```bash
flutter pub get
```

---

## Rust 环境配置 (Rust Environment Setup)

因为该插件依赖 Rust，需要首先安装 Rust 工具链：

Since this plugin depends on Rust, you need to install the Rust toolchain first:

1. 进入 Rust 官方网站：[https://www.rust-lang.org](https://www.rust-lang.org)
2. 按照指导安装 `rustup` 和 Rust 工具链

Alternatively, run the following command to install Rust:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

安装完成后，确保 Rust 版本新鲜：

After installation, ensure you have the latest version of Rust:

```bash
rustup update
```

然后安装 `flutter_rust_bridge` 的必要依赖：

Then install the dependencies required by `flutter_rust_bridge`:

```bash
cargo install flutter_rust_bridge_codegen
```

确保安装正确：

Verify the installation:

```bash
flutter_rust_bridge_codegen --help
```

---

## 使用说明 (Usage Instructions)

在代码中导入插件：

Import the plugin in your code:

```dart
import 'package:clipboard_listener/clipboard_listener.dart';
```

### 基本使用方式 (Basic Usage)

#### 1. 创建 Clipboard Listener (Create Clipboard Listener)

Initialize the clipboard listener and handle content changes:

```dart
final ClipboardListener clipboardListener = ClipboardListener(
  onClipboardChanged: (String? newContent) {
    print('Clipboard content changed: $newContent');
  },
);
```

#### 2. 启动监听 (Start Listening)

Start the clipboard listener:

```dart
clipboardListener.startListening();
```

#### 3. 停止监听 (Stop Listening)

Stop the clipboard listener:

```dart
clipboardListener.stopListening();
```

#### 4. 释放资源 (Dispose Resources)

Dispose the listener to free resources:

```dart
clipboardListener.dispose();
```

---

## API 描述 (API Description)

### 函数列表 (Function List)

| 函数名称 (Function Name)       | 说明 (Description)                                            |
|----------------------------------|--------------------------------------------------------------------|
| `startListening()`               | 启动剪贴板内容变化监听 Start listening for clipboard content changes. |
| `stopListening()`                | 停止监听 Stop listening for clipboard content changes.                   |
| `dispose()`                      | 释放资源 Release resources used by the listener.                         |

### 例子代码 (Example Code)

Here’s an example that demonstrates all the APIs:

```dart
import 'package:flutter/material.dart';
import 'package:clipboard_listener/clipboard_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ClipboardListener _clipboardListener;
  String _clipboardContent = 'No content yet';

  @override
  void initState() {
    super.initState();
    _clipboardListener = ClipboardListener(
      onClipboardChanged: (String? newContent) {
        setState(() {
          _clipboardContent = newContent ?? 'Clipboard is empty';
        });
      },
    );
    _clipboardListener.startListening();
  }

  @override
  void dispose() {
    _clipboardListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Clipboard Listener Example')),
        body: Center(
          child: Text('Clipboard Content: $_clipboardContent'),
        ),
      ),
    );
  }
}
```

---

## 其他信息 (Additional Information)

完整插件文档可以在 [clipboard_listener GitHub 页面](https://github.com/iakii/flutter_plugins/tree/master/packages/clipboard_listener) 查看。

The complete plugin documentation is available on the [clipboard_listener GitHub page
