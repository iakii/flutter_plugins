# flutter_wallpaper

A Flutter plugin for managing wallpapers, supporting setting images as wallpapers on desktop platforms.

一个用于管理壁纸的 Flutter 插件，支持在桌面端平台上将图片设为壁纸。

---

## Features / 功能

- Set wallpapers on desktop platforms.
- Supports local image paths.
- Provides easy-to-use APIs for seamless integration.
- Utilizes `flutter_rust_bridge` for enhanced performance.

- 在桌面平台上设置壁纸。
- 支持本地图片路径。
- 提供易于使用的 API，便于快速集成。
- 采用 `flutter_rust_bridge`，提高性能。

---

## Installation / 安装

### Rust Installation / 安装 Rust

This plugin uses `flutter_rust_bridge`, so you need to install Rust before proceeding:

此插件使用 `flutter_rust_bridge`，因此在使用之前需要安装 Rust：

1. Install Rust by following the official guide:

   通过官方指南安装 Rust：

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. After installation, ensure that Rust is added to your PATH:

   安装完成后，确保 Rust 已添加到 PATH 中：

   ```bash
   rustc --version
   ```

3. Install the `flutter_rust_bridge` CLI for code generation:

   安装 `flutter_rust_bridge` CLI 以生成代码：

   ```bash
   cargo install flutter_rust_bridge_codegen
   ```

### Plugin Installation / 安装插件

1. Add the following dependency in your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter_wallpaper:
       git:
         url: https://github.com/iakii/flutter_plugins.git
         path: packages/flutter_wallpaper
   ```

2. Run the following command to get the dependency:

   ```bash
   flutter pub get
   ```

---

## Usage / 使用方法

### Import the Package / 导入包

```dart
import 'package:flutter_wallpaper/flutter_wallpaper.dart';
```

### Initialization / 初始化

Before using the plugin, you must initialize it:

使用此插件之前，需要初始化：

```dart
await WallpaperManager.init();
```

### Example / 示例代码

Here is an example of how to use `flutter_wallpaper` to set a wallpaper:

以下是使用 `flutter_wallpaper` 设置壁纸的示例：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/flutter_wallpaper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WallpaperManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WallpaperExample(),
    );
  }
}

class WallpaperExample extends StatelessWidget {
  void _setWallpaper() async {
    final String imagePath = "/path/to/local/image.jpg";
    try {
      await WallpaperManager.setWallpaperFromPath(imagePath);
      print("Wallpaper set successfully!");
    } catch (e) {
      print("Failed to set wallpaper: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallpaper Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _setWallpaper,
          child: Text('Set Wallpaper'),
        ),
      ),
    );
  }
}
```

---

## API Reference / API 参考

### Methods / 方法

#### `init`

Initializes the plugin. This method must be called before any other API methods.

初始化插件，在调用其他 API 方法前，必须调用此方法。

**Usage / 用法**:

```dart
await WallpaperManager.init();
```

#### `setWallpaperFromPath`

Sets an image as the device wallpaper.

将图片设为设备壁纸。

**Parameters / 参数**:

- `String path`: Path to a local image file.

**Usage / 用法**:

```dart
await WallpaperManager.setWallpaperFromPath("/path/to/image.jpg");
```

---

## Supported Platforms / 支持平台

- Windows
- macOS
- Linux

---

## Contributing / 共同实现

Contributions are welcome! Feel free to submit issues and pull requests.

欢迎与论！欢迎提交问题和拉取请求。

---

## License / 许可证

This project is licensed under the MIT License.

此项目采用 MIT 协议。
