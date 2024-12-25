# flutter_rust_lib_core 插件使用说明 / flutter_rust_lib_core Plugin Usage Guide

这是一个仅支持桌面平台的 Flutter 插件，旨在将 Rust 代码集成到 Flutter 应用中。 This is a Flutter plugin for desktop platforms only, designed to integrate Rust code into Flutter applications.

## 安装 / Installation

1. **克隆仓库 / Clone the repository**:

   ```bash
   git clone https://github.com/iakii/flutter_plugins.git
   cd flutter_plugins/packages/flutter_rust_lib_core
   ```

2. **在 Flutter 项目中添加依赖 / Add dependency in your Flutter project**:

   在 `pubspec.yaml` 文件中，添加以下内容： In your `pubspec.yaml` file, add the following:

   ```yaml
   dependencies:
     flutter_rust_lib_core:
       path: ../path_to_flutter_rust_lib_core
   ```

   请将 `../path_to_flutter_rust_lib_core` 替换为实际路径。 Replace `../path_to_flutter_rust_lib_core` with the actual path.

## 使用插件 / Using the Plugin

1. **导入包 / Import the package**:

   ```dart
   import 'package:flutter_rust_lib_core/flutter_rust_lib_core.dart';
   ```

2. **调用 Rust 函数 / Call Rust functions**:

   ```dart
   Future<void> callRustFunction() async {
     final result = await FlutterRustLibCore.someRustFunction();
     print(result);
   }
   ```

   请将 `someRustFunction` 替换为实际的 Rust 函数名。 Replace `someRustFunction` with the actual Rust function name.

## API 使用及详细说明 / API Usage and Detailed Description

`flutter_rust_lib_core` 提供了与 Rust 代码交互的功能。 `flutter_rust_lib_core` provides functionality to interact with Rust code.

在使用前，请确保已在 Rust 代码中定义了所需的函数，并使用 `flutter_rust_bridge` 生成相应的绑定。 Before using, ensure that the required functions are defined in your Rust code and the corresponding bindings are generated using `flutter_rust_bridge`.

有关 `flutter_rust_bridge` 的详细信息，请参阅官方文档： For detailed information on `flutter_rust_bridge`, refer to the official documentation:



## 集成 flutter_rust_bridge 和安装 Rust / Integrating flutter_rust_bridge and Installing Rust

1. **安装 Rust / Install Rust**:

   请按照官方指南安装 Rust： Follow the official guide to install Rust:

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

   安装完成后，确保将 Rust 的 `bin` 目录添加到系统的 `PATH` 中。 After installation, ensure that Rust's `bin` directory is added to your system's `PATH`.

2. **安装 flutter_rust_bridge 代码生成器 / Install flutter_rust_bridge code generator**:

   ```bash
   cargo install flutter_rust_bridge_codegen
   ```

   在 Dart 项目中，添加以下依赖： In your Dart project, add the following dependencies:

   ```bash
   flutter pub add flutter_rust_bridge
   flutter pub add --dev build_runner
   flutter pub add --dev freezed
   flutter pub add freezed_annotation
   ```
   

3. **生成绑定代码 / Generate binding code**:

   在项目根目录下，运行： In the project root directory, run:

   ```bash
   flutter_rust_bridge_codegen --rust-input native/src/api.rs --dart-output lib/bridge_generated.dart
   ```

   请将 `native/src/api.rs` 和 `lib/bridge_generated.dart` 替换为实际的路径。 Replace `native/src/api.rs` and `lib/bridge_generated.dart` with the actual paths.
