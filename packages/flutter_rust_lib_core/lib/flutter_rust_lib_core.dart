library flutter_rust_lib_core;

import 'package:flutter_rust_lib_core/src/rust/frb_generated.dart' as rust_core;

export 'src/rust/api/application.dart';
export 'src/rust/frb_generated.dart' show RustLib;

export 'src/rust/api/tiny_png/tiny_png.dart';

export 'src/rust/api/system_tray/entity.dart';

export 'src/rust/api/system_info/cpus.dart';
export 'src/rust/api/system_info/entity.dart';
export 'src/rust/api/system_info/networks.dart';
export 'src/rust/api/system_info/process.dart';
export 'src/rust/api/system_info/system_info.dart';

export 'src/rust/api/system_clipboard/clipboard.dart';

export 'src/rust/api/keypress_simulator/simulator.dart';

export 'src/rust/api/active_window/window.dart';

class _FlutterRustLibCore {
  // 单例
  static final _FlutterRustLibCore _instance = _FlutterRustLibCore._internal();
  factory _FlutterRustLibCore() => _instance;
  _FlutterRustLibCore._internal();

  Future<void> init() async {
    await rust_core.RustLib.init();
  }
}

final flutterRustLibCore = _FlutterRustLibCore._instance;
