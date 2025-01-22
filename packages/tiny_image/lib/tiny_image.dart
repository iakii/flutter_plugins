library;

import 'package:tiny_image/src/rust/frb_generated.dart';

// export 'src/rust/api/windows.dart';
export 'src/rust/api/webp.dart';
export 'src/rust/api/tiny_png.dart';
export 'src/rust/api/png.dart';
export 'src/rust/api/application.dart';
export 'src/rust/frb_generated.dart' show RustLib;

class TinyImage {
  static bool _inited = false;

  static Future<void> init() async {
    if (_inited) return;
    await RustLib.init();
    _inited = true;
  }
}
