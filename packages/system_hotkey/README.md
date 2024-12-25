# System Hotkey Plugin for Flutter

[![GitHub stars](https://img.shields.io/github/stars/iakii/flutter_plugins.svg?style=social)](https://github.com/iakii/flutter_plugins)

## Introduction / 简介
The `system_hotkey` plugin allows Flutter applications to register and listen to global system hotkeys. It supports macOS, Windows, and Linux.
`system_hotkey` 插件允许 Flutter 应用注册并监听全局系统热键，支持 macOS、Windows 和 Linux。

## Installation / 安装
To use this plugin, include it as a dependency in your Flutter project via Git:
通过 Git 将插件添加到您的 Flutter 项目中：

```yaml
dependencies:
  system_hotkey:
    git:
      url: https://github.com/iakii/flutter_plugins.git
      path: packages/system_hotkey
```

## Usage / 使用方法

1. Import the plugin / 导入插件：
   ```dart
   import 'package:system_hotkey/system_hotkey.dart';
   ```

2. Create a `HotKeyManager` instance and define your hotkeys / 创建 `HotKeyManager` 实例并定义热键：
   ```dart
   final hotKeyManager = HotKeyManager.instance;

   void setupHotKeys() {
     hotKeyManager.register(
       HotKey(
         KeyCode.keyA,
         modifiers: [KeyModifier.alt],
       ),
       (isPressed) {
         if (isPressed) {
           print('Alt + A was pressed! / Alt + A 被按下!');
         }
       },
     );
   }

   void disposeHotKeys() {
     hotKeyManager.unregisterAll();
   }
   ```

3. Call the `setupHotKeys()` function in your app’s initialization lifecycle, such as in `initState()` / 在应用的生命周期初始化方法（如 `initState()`）中调用 `setupHotKeys()`。

4. Unregister all hotkeys when your app is disposed / 在应用销毁时注销所有热键。

## API Overview / API 概览

- **HotKeyManager:**
  - `register(HotKey hotKey, HotKeyHandler handler)`: Registers a hotkey / 注册热键。
  - `unregister(HotKey hotKey)`: Unregisters a specific hotkey / 注销指定热键。
  - `unregisterAll()`: Unregisters all hotkeys / 注销所有热键。
- **HotKey:** Represents the key combination (e.g., `KeyCode.keyA`, `KeyModifier.alt`) / 表示按键组合（例如：`KeyCode.keyA`，`KeyModifier.alt`）。
- **KeyCode:** Enum for key codes / 键码的枚举值。
- **KeyModifier:** Enum for key modifiers like Ctrl, Alt, and Shift / 修饰键的枚举值，如 Ctrl、Alt 和 Shift。

## Rust Integration via flutter_rust_bridge / 使用 flutter_rust_bridge 的 Rust 集成

### Why Rust? / 为什么选择 Rust？
The plugin relies on native Rust libraries for robust and efficient cross-platform hotkey detection.
插件依赖于原生 Rust 库，以提供高效、强大的跨平台热键检测。

### Prerequisites / 环境准备

1. Install Rust / 安装 Rust：
   - For Windows / 对于 Windows：[Download Rust](https://rustup.rs) and follow the instructions / 下载 Rust 并按照说明进行安装。
   - For macOS/Linux / 对于 macOS/Linux：Run the following command in your terminal / 在终端中运行以下命令：
     ```bash
     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
     ```
2. Add the Rust toolchain to your PATH / 将 Rust 工具链添加到 PATH：
   ```bash
   source $HOME/.cargo/env
   ```
3. Install `flutter_rust_bridge` dependencies / 安装 `flutter_rust_bridge` 依赖：
   ```bash
   cargo install flutter_rust_bridge_codegen
   ```

### Build Instructions / 构建说明

- Ensure your Rust environment is set up correctly / 确保正确设置了 Rust 环境。
- Follow the instructions in the [flutter_rust_bridge documentation](https://github.com/fzyzcjy/flutter_rust_bridge) to integrate with your Flutter project / 按照 [flutter_rust_bridge 文档](https://github.com/fzyzcjy/flutter_rust_bridge) 中的说明与您的 Flutter 项目集成。

---

If you have any issues or suggestions, feel free to open an issue on the [GitHub repository](https://github.com/iakii/flutter_plugins). / 如果您有任何问题或建议，请随时在 [GitHub 仓库](https://github.com/iakii/flutter_plugins) 中提交问题。
