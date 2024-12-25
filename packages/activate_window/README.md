# Activate Window Plugin

## 介绍 (Introduction)

`activate_window` 是一款面向 Flutter 桌面应用的插件，可用于管理应用窗口。该插件仅支持 macOS 平台，提供获取窗口列表和切换窗口等功能。

`activate_window` is a Flutter plugin for managing application windows. This plugin supports macOS only and provides functionalities such as retrieving the list of windows and switching between windows.

---

## 安装 (Installation)

通过 Git 使用此插件：

Install the plugin via Git:

```yaml
# 在 pubspec.yaml 文件中添加以下内容
# Add the following to your pubspec.yaml file
dependencies:
  activate_window:
    git:
      url: https://github.com/iakii/flutter_plugins.git
      path: packages/activate_window
```

然后执行以下命令安装依赖：

Then run the following command to install dependencies:

```bash
flutter pub get
```

---

## 使用说明 (Usage Instructions)

在代码中导入插件：

Import the plugin in your code:

```dart
import 'package:activate_window/activate_window.dart';
```

### 基本使用方式 (Basic Usage)

#### 1. 获取所有窗口 (Get All Windows)

Retrieve a list of all windows:

```dart
final windows = await ActivateWindow.getAllWindows();
print(windows);
```

#### 2. 切换到指定窗口 (Activate a Specific Window)

Activate a specific window by its identifier:

```dart
await ActivateWindow.activateWindow(windowId);
```

#### 3. 获取当前窗口 (Get Current Window)

Retrieve the current active window:

```dart
final currentWindow = await ActivateWindow.getCurrentWindow();
print(currentWindow);
```

---

## API 描述 (API Description)

### 函数列表 (Function List)

| 函数名称 (Function Name)   | 说明 (Description)                                      |
|--------------------------------|----------------------------------------------------------|
| `getAllWindows()`              | 获取所有窗口 Get a list of all available windows.           |
| `activateWindow(windowId)`     | 切换到指定窗口 Activate a specific window by its ID. |
| `getCurrentWindow()`           | 获取当前窗口 Get the currently active window.           |

### 例子代码 (Example Code)

Here’s an example that demonstrates all the APIs:

```dart
import 'package:flutter/material.dart';
import 'package:activate_window/activate_window.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Activate Window Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final windows = await ActivateWindow.getAllWindows();
                  print(windows);
                },
                child: const Text('获取所有窗口 (Get All Windows)')),
              ElevatedButton(
                onPressed: () async {
                  // Replace `windowId` with the ID of the window you want to activate
                  const windowId = 'example_window_id';
                  await ActivateWindow.activateWindow(windowId);
                },
                child: const Text('切换窗口 (Activate Window)')),
              ElevatedButton(
                onPressed: () async {
                  final currentWindow = await ActivateWindow.getCurrentWindow();
                  print(currentWindow);
                },
                child: const Text('获取当前窗口 (Get Current Window)')),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 其他信息 (Additional Information)

完整插件文档可以在 [activate_window GitHub 页面](https://github.com/iakii/flutter_plugins/tree/master/packages/activate_window) 查看。

The complete plugin documentation is available on the [activate_window GitHub page](https://github.com/iakii/flutter_plugins/tree/master/packages/activate_window).
