library clipboard_listener;

import 'dart:typed_data';

import 'package:flutter_rust_lib_core/flutter_rust_lib_core.dart';
import 'package:flutter_rust_lib_core/src/rust/api/active_window/window.dart'
    as window;
import 'package:flutter_rust_lib_core/src/rust/api/system_clipboard/clipboard.dart'
    as clip;

class _ClipboardListenerManager {
  // 单例
  static final _ClipboardListenerManager instance =
      _ClipboardListenerManager._internal();
  factory _ClipboardListenerManager() => instance;
  _ClipboardListenerManager._internal();

  // Future<void> init() async {
  //   await flutterRustLibinit();
  // }

  Future<void> on(Function(ClipboardData data) callback) async {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    clip.clipboardListenerStart(dartCallback: (_) {
      final data = clip.getClipboardData();
      callback(data);
      return Future.value('ok');
    });
  }

  ClipboardData getclipboardData() {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    return clip.getClipboardData();
  }

  void setClipboardData(ClipboardData data) {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    clip.setClipboardData(data: data);
  }

  void setText2Clipboard(String data) {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    setClipboardData(ClipboardData(dataType: DataType.text, content: data));
  }

  void setImage2Clipboard(Uint8List bytesdata) {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    clip.setClipboardData(
      data: ClipboardData(
        dataType: DataType.image,
        image: ClipImage(
          width: 0,
          height: 0,
          bytes: bytesdata,
        ),
      ),
    );
  }

  void setFile2Clipboard(List<String> filepaths) {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    clip.setClipboardData(
      data: ClipboardData(
        dataType: DataType.file,
        paths: filepaths,
      ),
    );
  }

  WindowIconEntity getCurrentActiveWindow() {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    return window.getCurrentActiveWindow();
  }

  List<WindowIconEntity> getAllOpenWindows() {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    return window.getAllOpenWindows();
  }

  IconEntity getWindowIconByWindowIsd(int id) {
    if (!flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    }
    return window.getWindowIconByWindowId(id: id);
  }
}

final clipboardListenerManager = _ClipboardListenerManager.instance;
