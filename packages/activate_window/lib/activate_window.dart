import 'dart:io';

import 'package:flutter/services.dart';

class ActivateWindow {
  static const _platform = MethodChannel('activate_window_plugin');

  // 获取所有窗口的信息
  static Future<List<Map<dynamic, dynamic>>> getAllWindows() async {
    if (Platform.isMacOS) {
      final windows = await _platform.invokeMethod('getAllWindows');
      return List<Map<dynamic, dynamic>>.from(windows);
    }
    return [];
  }

  // 根据窗口ID激活窗口
  static Future<bool> activateWindow(String id) async {
    if (Platform.isWindows) {
      return true;
    }
    try {
      await _platform.invokeMethod('activateWindow', id);
      return true;
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to activate window: ${e.message}');
      return false;
    }
  }

  // 获取当前窗口的信息
  static Future<Map<dynamic, dynamic>?> getCurrentWindow() async {
    if (!Platform.isMacOS) {
      return null;
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
