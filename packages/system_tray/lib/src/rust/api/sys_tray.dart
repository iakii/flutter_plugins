// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// hello world

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'entity.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `button_2_my_button`, `load_icon`, `position_2_my_position`, `rect_2_my_rect`, `tray_icon_event_to_my_event`

String greet({required String name}) =>
    RustLib.instance.api.crateApiSysTrayGreet(name: name);

Stream<FFISysTrayEvent> builder({required String path}) =>
    RustLib.instance.api.crateApiSysTrayBuilder(path: path);
