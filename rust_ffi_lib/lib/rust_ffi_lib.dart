library rust_ffi_lib;

import 'package:rust_ffi_lib/src/rust/api/paste.dart' as hotkey;
import 'package:rust_ffi_lib/src/rust/api/sys.dart' as sys;
import 'package:rust_ffi_lib/src/rust/frb_generated.dart';

class _RustFFILib {
  _RustFFILib() {
    RustLib.init();
  }

  Future<void> paste() => hotkey.paste();
  Future<void> insert() => hotkey.insert();
  Future<String?> findPid(String processName) => sys.findPid(name: processName);
}

final rustFFILib = _RustFFILib();
