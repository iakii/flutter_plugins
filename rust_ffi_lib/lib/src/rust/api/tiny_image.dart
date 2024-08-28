// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<void> parseWebp(
        {required String path,
        required String output,
        required double quality}) =>
    RustLib.instance.api.crateApiTinyImageParseWebp(
        path: path, output: output, quality: quality);

/// 压缩png
Future<void> parsePng(
        {required String path, required String output, required int level}) =>
    RustLib.instance.api
        .crateApiTinyImageParsePng(path: path, output: output, level: level);

/// 压缩jpg
Future<void> parseJpg(
        {required String path, required String output, required int quality}) =>
    RustLib.instance.api.crateApiTinyImageParseJpg(
        path: path, output: output, quality: quality);

Future<void> compressImage({required String path, required int quality}) =>
    RustLib.instance.api
        .crateApiTinyImageCompressImage(path: path, quality: quality);
