library clipboard_listener;

import 'dart:typed_data';

import 'package:flutter_rust_lib_core/flutter_rust_lib_core.dart' as core;

class _ClipboardListenerManager {
  // 单例
  static final _ClipboardListenerManager instance = _ClipboardListenerManager._internal();
  factory _ClipboardListenerManager() => instance;
  _ClipboardListenerManager._internal();

  Future<void> init() async {
    await core.flutterRustLibCore.init();
  }

  Future<void> on(Function(core.ClipboardData data) callback) async {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    core.clipboardListenerStart(dartCallback: (_) {
      final data = core.getClipboardData();
      callback(data);
      return Future.value('ok');
    });
  }

  core.ClipboardData getclipboardData() {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    return core.getClipboardData();
  }

  void setClipboardData(core.ClipboardData data) {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    core.setClipboardData(data: data);
  }

  void setText2Clipboard(String data) {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    setClipboardData(core.ClipboardData(dataType: core.DataType.text, content: data));
  }

  void setImage2Clipboard(Uint8List bytesdata) {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    core.setClipboardData(
      data: core.ClipboardData(
        dataType: core.DataType.image,
        image: core.CPImage(
          width: 0,
          height: 0,
          bytes: bytesdata,
        ),
      ),
    );
  }

  void setFile2Clipboard(List<String> filepaths) {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    core.setClipboardData(
      data: core.ClipboardData(
        dataType: core.DataType.file,
        paths: filepaths,
      ),
    );
  }

  core.WindowIconEntity getCurrentActiveWindow() {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    return core.getCurrentActiveWindow();
  }

  List<core.WindowIconEntity> getAllOpenWindows() {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    return core.getAllOpenWindows();
  }

  core.IconEntity getWindowIconByWindowId(int id) {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception("You must call `await clipboardListenerManager.init();` first.");
    }
    return core.getWindowIconByWindowId(id: id);
  }
}

final clipboardListenerManager = _ClipboardListenerManager.instance;
