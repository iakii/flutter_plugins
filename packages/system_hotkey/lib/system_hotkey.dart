library system_hotkey;

import 'package:system_hotkey/src/rust/api/hotkey.dart';
import 'package:system_hotkey/src/rust/frb_generated.dart';

class _SystemHotkeyManager {
  // 单例
  static final _SystemHotkeyManager instance = _SystemHotkeyManager._internal();
  factory _SystemHotkeyManager() => instance;
  _SystemHotkeyManager._internal();

  bool _isInit = false;

  Future<void> init() async {
    if (_isInit) return;
    await RustLib.init();
    _isInit = true;
  }

  Future<void> start(Function() callback) async {
    if (!_isInit) {
      throw Exception("You must call `await systemHokeyManager.init();` first.");
    }

    middleButtonClickListener(dartCallback: (String message) {
      print("object==$message");
      callback();
      return Future.value("ok");
    });
  }

  Future<void> kill() async {
    if (!_isInit) {
      throw Exception("You must call `await systemHokeyManager.init();` first.");
    }
    RustLib.dispose();
  }
}

final systemHokeyManager = _SystemHotkeyManager.instance;
