library rust_ffi_lib;

import 'package:rust_ffi_lib/src/rust/api/paste.dart' as hotkey;
import 'package:rust_ffi_lib/src/rust/api/simple.dart' as api;
import 'package:rust_ffi_lib/src/rust/api/sys.dart' as sys;
import 'package:rust_ffi_lib/src/rust/frb_generated.dart';

class _RustFFILib {
  Future<void> init() async {
    await RustLib.init();
  }

  Future<void> paste() => hotkey.paste();
  Future<void> insert() => hotkey.insert();
  Future<String?> findPid(String processName) => sys.findPid(name: processName);
  String greet({required String name}) => api.greet(name: name);
}

final rustFFILib = _RustFFILib();
