# System Information 插件使用指南
# System Information Plugin User Guide

该插件用于获取系统信息，基于 `flutter_rust_bridge` 实现，允许在 Flutter 应用中调用 Rust 代码。
This plugin retrieves system information and is implemented using `flutter_rust_bridge`, allowing Rust code to be called within a Flutter application.

## 目录
## Table of Contents

1. [安装](#安装)
1. [Installation](#installation)
2. [使用方法](#使用方法)
2. [Usage](#usage)
3. [API 说明](#api-说明)
3. [API Description](#api-description)
4. [Rust 环境配置](#rust-环境配置)
4. [Rust Environment Setup](#rust-environment-setup)

## 安装
## Installation

在 `pubspec.yaml` 中添加以下依赖：
Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  system_infomation:
    git:
      url: https://github.com/iakii/flutter_plugins.git
      path: packages/system_infomation
```

然后，运行 `flutter pub get` 获取依赖。
Then, run `flutter pub get` to fetch the dependency.

## 使用方法
## Usage

1. **导入包：**
1. **Import the package:**

   ```dart
   import 'package:system_infomation/system_infomation.dart';
   ```

2. **初始化插件：**
2. **Initialize the plugin:**

   ```dart
   await systemInfomationManager.init();
   ```

3. **调用 API：**
3. **Call the API:**

   ```dart
   // 获取网络信息
   // Get network information
   List<NetWorkEntity> networks = systemInfomationManager.getNetworks();

   // 获取进程信息
   // Get process information
   List<ProcessEntity> processes = systemInfomationManager.getProcesses();
   ```

## API 说明
## API Description

### `SystemInfomationManager`

`SystemInfomationManager` 类提供了获取系统信息的功能。
The `SystemInfomationManager` class provides functionality to retrieve system information.

#### 方法
#### Methods

- **`init()`**: 初始化插件，必须在调用其他方法之前执行。
- **`init()`**: Initializes the plugin; must be called before invoking other methods.

  ```dart
  Future<void> init()
  ```

  **示例：**
  **Example:**

  ```dart
  await systemInfomationManager.init();
  ```

- **`getNetworks()`**: 返回网络信息的列表。
- **`getNetworks()`**: Returns a list of network information.

  ```dart
  List<NetWorkEntity> getNetworks()
  ```

  **返回值：**
  **Returns:**

  - `List<NetWorkEntity>`: 包含网络信息的列表。
  - `List<NetWorkEntity>`: A list containing network information.

  **示例：**
  **Example:**

  ```dart
  List<NetWorkEntity> networks = systemInfomationManager.getNetworks();
  ```

- **`getProcesses()`**: 返回进程信息的列表。
- **`getProcesses()`**: Returns a list of process information.

  ```dart
  List<ProcessEntity> getProcesses()
  ```

  **返回值：**
  **Returns:**

  - `List<ProcessEntity>`: 包含进程信息的列表。
  - `List<ProcessEntity>`: A list containing process information.

  **示例：**
  **Example:**

  ```dart
  List<ProcessEntity> processes = systemInfomationManager.getProcesses();
  ```

## Rust 环境配置
## Rust Environment Setup

由于该插件使用了 `flutter_rust_bridge`，需要在开发环境中安装 Rust。
Since this plugin uses `flutter_rust_bridge`, Rust needs to be installed in your development environment.

1. **安装 Rust：**
1. **Install Rust:**

   请按照 [官方指南](https://www.rust-lang.org/zh-CN/tools/install) 安装 Rust。
   Follow the [official guide](https://www.rust-lang.org/tools/install) to install Rust.

2. **配置 `flutter_rust_bridge`：**
2. **Configure `flutter_rust_bridge`:**

   请参考 [flutter_rust_bridge 官方文档](https://cjycode.com/flutter_rust_bridge/) 了解如何在项目中集成 Rust 代码。
   Refer to the [flutter_rust_bridge official documentation](https://cjycode.com/flutter_rust_bridge/) to learn how to integrate Rust code into your project.

3. **构建项目：**
3. **Build the project:**

   确保在项目根目录下运行以下命令以生成必要的代码绑定：
   Ensure you run the following command in the project root directory to generate the necessary code bindings:

   ```bash
   flutter_rust_bridge_codegen --rust-input native/src/api.rs --dart-output lib/bridge_generated.dart
   ```

   然后，使用 `flutter run` 运行项目。
   Then, run the project using `flutter run`.

## 参考资料
## References

- [flutter_rust_bridge 官方文档](https://cjycode.com/flutter_rust_bridge/)
- [flutter_rust_bridge Official Documentation](https://cjycode.com/flutter_rust_bridge/)
- [Rust 官方安装指南](https://www.rust-lang.org/zh-CN/tools/install)
- [Rust Official Installation Guide](https://www.rust-lang.org/tools/install) 