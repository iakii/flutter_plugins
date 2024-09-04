# clipboard_listener
 
这个插件允许 Flutter 应用程序观察剪贴板的变化。


<!-- [English](./README.md) | 简体中文 -->

---
 

## 平台支持
Comprehensive clipboard functionality for Flutter.

Flutter 的全面剪贴板功能。


Supports macOS, iOS, Android, Windows, Linux and Web.

支持 macOS、iOS、Android、Windows、Linux 和 Web。


Platform agnostic code for reading and writing common clipboard formats.

用于读取和写入常见剪贴板格式的平台无关代码。


Support for custom data formats.

支持自定义数据格式。


Multiple representations for clipboard items.

剪贴板项的多种表示形式。


Providing clipboard data on demand.

按需提供剪贴板数据。


## Quickstart 快速入门

###  Install 安装


`clipboard_listener` uses Rust internally to implement low-level platform specific functionality.

`clipboard_listener` 在内部使用 Rust 来实现低级平台特定的功能。


If you don't have Rust installed, the plugin will automatically download precompiled binaries for target platform.

如果你没有安装 Rust，该插件将自动下载目标平台的预编译二进制文件。


If you want to have the Rust code compiled from source instead, you can install Rust through rustup. The presence of rustup will be detected during build automatically.

如果你想改为从源代码编译 Rust 代码，你可以通过 rustup 安装 Rust。在构建过程中会自动检测到 rustup 的存在。


For macOS or Linux, execute the following command in Terminal.

对于 macOS 或 Linux，请在终端中执行以下命令。


```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
For Windows, you can use the Rust Installer.

对于 Windows，您可以使用 Rust 安装程序。


In case you have Rust already installed, make sure to update it to latest version:

如果您已经安装了 Rust，请确保将其更新到最新版本：


```bash
rustup update
```
That is it. The build integration will automatically install required Rust targets and other dependencies (NDK). This also means that first build might take a little bit longer.

就是这样。构建集成将自动安装所需的 Rust 目标和其他依赖项 （NDK）。这也意味着首次构建可能需要更长的时间。


Add this to your package's pubspec.yaml file:

将此添加到你的软件包的 pubspec.yaml 文件：

```yaml
dependencies:
  clipboard_listener: 
    git:
      url: https://github.com/iakii/clipboard_listener.git
      ref: master
```


### Usage 用法

```dart
 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:clipboard_listener/clipboard_listener.dart';

Future<void> main() async {
  await RustLib.init();
  clipboardListenerStart(dartCallback: (_) {
    //Reading from clipboard 从剪贴板读取
    final data = getClipboardData();
    debugPrint(data.dataType.name);
    if (data.dataType == DataType.file) {
      debugPrint(data.paths.toString());
    } else if (data.dataType == DataType.text) {
      debugPrint(data.content);
    } else if (data.dataType == DataType.image) {
      debugPrint("width: ${data.image!.width}, height: ${data.image!.height} ,size: ${data.image!.bytes.length}");
      File file = File('temp/clipboard_image.png');
      file.writeAsBytesSync(data.image!.bytes);
    }
    return Future.value('ok');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text('Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
        ),
      ),
    );
  }
}

```

## Running the example 运行示例

Example project is available at super_clipboard/example.

示例项目可在 super_clipboard/example 中找到。

```bash
git clone https://github.com/iakii/clipboard_listener.git
cd clipboard_listener/example
flutter run
```

After this you can open the folder in VSCode and run the `clipboard_listener` launcher configuration.

在此之后，您可以在 VSCode 中打开文件夹并运行 `clipboard_listener` 启动器配置。


## 许可证

[MIT](./LICENSE)