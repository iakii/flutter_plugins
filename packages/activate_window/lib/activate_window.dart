import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

class ActivateWindow {
  static const _platform = MethodChannel('activate_window_plugins');

  // 获取所有窗口的信息
  static Future<List<Map<dynamic, dynamic>>> getAllWindows() async {
    final windows = await _platform.invokeMethod('getAllWindows');
    return List<Map<dynamic, dynamic>>.from(windows);
  }

  // 根据窗口ID激活窗口
  static Future<bool> activateWindow(String bundleIdentifier) async {
    if (Platform.isWindows) {
      return true;
    }
    try {
      await _platform.invokeMethod('activateWindow', bundleIdentifier);
      return true;
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to activate window: ${e.message}');
      return false;
    }
  }

  // 获取当前窗口的信息
  static Future<Map<dynamic, dynamic>?> getCurrentWindow() async {
    if (Platform.isWindows) {
      final hActiveWindow = GetForegroundWindow();
      // final textLength = GetWindowTextLength(hActiveWindow);
      // final pText = calloc<Utf16>(textLength + 1);
      // GetWindowText(hActiveWindow, pText, textLength + 1);
      // final windowText = pText.toDartString();
      // calloc.free(pText);
      // ignore: avoid_print
      // print('Active window title: $windowText');

      var hIcon = SendMessage(hActiveWindow, WM_GETICON, ICON_BIG, 0);

      Uint8List? uint8list;
      if (hIcon == 0) {
        hIcon = SendMessage(hActiveWindow, WM_GETICON, ICON_SMALL, 0);
      } else {
        // Convert the HICON to a Bitmap
        final pIconInfo = calloc<ICONINFO>();
        GetIconInfo(hIcon, pIconInfo);

        final pBitmapInfo = calloc<BITMAP>();
        GetObject(pIconInfo.ref.hbmColor, sizeOf<BITMAP>(), pBitmapInfo.cast());

        final bitmapData = calloc<Uint8>(
            pBitmapInfo.ref.bmWidthBytes * pBitmapInfo.ref.bmHeight);
        final pBitmapInfoHeader = calloc<BITMAPINFOHEADER>()
          ..ref.biSize = sizeOf<BITMAPINFOHEADER>()
          ..ref.biWidth = pBitmapInfo.ref.bmWidth
          ..ref.biHeight = -pBitmapInfo.ref.bmHeight // top-down image
          ..ref.biPlanes = 1
          ..ref.biBitCount = 32
          ..ref.biCompression = BI_COMPRESSION.BI_RGB;

        final hdc = GetDC(NULL);
        GetDIBits(hdc, pIconInfo.ref.hbmColor, 0, pBitmapInfo.ref.bmHeight,
            bitmapData, pBitmapInfoHeader.cast(), DIB_USAGE.DIB_RGB_COLORS);
        ReleaseDC(NULL, hdc);

        // Convert the Bitmap to a Uint8List
        uint8list = Uint8List.fromList(bitmapData.asTypedList(
            pBitmapInfo.ref.bmWidthBytes * pBitmapInfo.ref.bmHeight));

        // Clean up
        calloc.free(pIconInfo);
        calloc.free(pBitmapInfo);
        calloc.free(bitmapData);
        calloc.free(pBitmapInfoHeader);
      }

      return {
        "icon": uint8list != null ? base64Encode(uint8list) : null,
        "title": "windowText",
      };
    }

    try {
      final window = await _platform.invokeMethod('getCurrentWindow');
      return Map<dynamic, dynamic>.from(window);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
