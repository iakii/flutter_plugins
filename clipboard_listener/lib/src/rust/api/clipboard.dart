// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../lib.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `on_clipboard_change`

String greet({required String name}) =>
    RustLib.instance.api.crateApiClipboardGreet(name: name);

Future<void> clipboardListenerStart(
        {required FutureOr<String> Function(String) dartCallback}) =>
    RustLib.instance.api
        .crateApiClipboardClipboardListenerStart(dartCallback: dartCallback);

ClipboardData getClipboardData() =>
    RustLib.instance.api.crateApiClipboardGetClipboardData();

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<Manager>>
abstract class Manager implements RustOpaqueInterface {
  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<Manager> newInstance({required SenderString sender}) =>
      RustLib.instance.api.crateApiClipboardManagerNew(sender: sender);
}

class ClipboardData {
  final DataType dataType;
  final String? content;
  final CPImage? image;
  final List<String>? paths;
  final String? icon;
  final String? appName;

  const ClipboardData({
    required this.dataType,
    this.content,
    this.image,
    this.paths,
    this.icon,
    this.appName,
  });

  @override
  int get hashCode =>
      dataType.hashCode ^
      content.hashCode ^
      image.hashCode ^
      paths.hashCode ^
      icon.hashCode ^
      appName.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClipboardData &&
          runtimeType == other.runtimeType &&
          dataType == other.dataType &&
          content == other.content &&
          image == other.image &&
          paths == other.paths &&
          icon == other.icon &&
          appName == other.appName;
}

class CPImage {
  final int width;
  final int height;
  final Uint8List bytes;

  const CPImage({
    required this.width,
    required this.height,
    required this.bytes,
  });

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ bytes.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CPImage &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height &&
          bytes == other.bytes;
}

enum DataType {
  file,
  text,
  image,
  ;
}
