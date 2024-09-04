library clipboard_listener;

import 'dart:typed_data';

import 'src/rust/api/active_window.dart' as win;

import 'src/rust/api/clipboard.dart' as rust;
import 'src/rust/frb_generated.dart';
export 'src/rust/api/clipboard.dart'
    show ClipboardData, DataType, CPImage, greet;
export 'src/rust/api/active_window.dart'
    show
        IconEntity,
        WindowIconEntity,
        WindowEntity,
        PositionEntity,
        InfoEntity,
        UsageEntity;

class _ClipboardListenerManager {
  // 单例
  static _ClipboardListenerManager? _instance;
  _ClipboardListenerManager._();
  factory _ClipboardListenerManager() {
    _instance ??= _ClipboardListenerManager._();
    return _instance!;
  }
  bool inited = false;

  Future<void> init() async {
    inited = true;
    await RustLib.init();
  }

  Future<void> on(Function(rust.ClipboardData data) callback) async {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    rust.clipboardListenerStart(dartCallback: (_) {
      final data = rust.getClipboardData();
      callback(data);
      return Future.value('ok');
    });
  }

  rust.ClipboardData getclipboardData() {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    return rust.getClipboardData();
  }

  void setClipboardData(rust.ClipboardData data) {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    rust.setClipboardData(data: data);
  }

  void setText2Clipboard(String data) {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    setClipboardData(
        rust.ClipboardData(dataType: rust.DataType.text, content: data));
  }

  void setImage2Clipboard(Uint8List bytesdata) {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    rust.setClipboardData(
      data: rust.ClipboardData(
        dataType: rust.DataType.image,
        image: rust.CPImage(
          width: 0,
          height: 0,
          bytes: bytesdata,
        ),
      ),
    );
  }

  void setFile2Clipboard(List<String> filepaths) {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    rust.setClipboardData(
      data: rust.ClipboardData(
        dataType: rust.DataType.file,
        paths: filepaths,
      ),
    );
  }

  win.WindowIconEntity getCurrentActiveWindow() {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    return win.getCurrentActiveWindow();
  }

  List<win.WindowIconEntity> getAllOpenWindows() {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    return win.getAllOpenWindows();
  }

  win.IconEntity getWindowIconByWindowId(int id) {
    if (!inited)
      throw Exception(
          "You must call `await clipboardListenerManager.init();` first.");
    return win.getWindowIconByWindowId(id: id);
  }
}

final clipboardListenerManager = _ClipboardListenerManager._instance!;
