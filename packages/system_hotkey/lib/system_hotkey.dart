library system_hotkey;

import 'package:flutter/services.dart';
import 'package:hotkey_manager_platform_interface/hotkey_manager_platform_interface.dart';
import 'package:system_hotkey/src/rust/api/hotkey.entity.dart';
import 'package:system_hotkey/src/rust/api/listen.dart';
import 'package:system_hotkey/src/rust/lisen.dart';

export 'package:hotkey_manager_platform_interface/hotkey_manager_platform_interface.dart';
export 'package:system_hotkey/src/rust/api/hotkey.entity.dart';
export 'package:system_hotkey/src/rust/api/listen.dart';

class _SystemHotkeyManager extends HotkeyLisener {
  // 单例
  static final _SystemHotkeyManager instance = _SystemHotkeyManager._internal();
  factory _SystemHotkeyManager() => instance;
  _SystemHotkeyManager._internal();

  @override
  void onKeyPress(LogicalKeyboardKey? logicalKey, HotKeyScope scope) {
    final hotKeys = registeredHotKeyList.where((e) {
      List<HotKeyModifier> modifiers = HotKeyModifier.values.where((e) => e.physicalKeys.any(physicalKeyPressed.contains)).toList();
      if (!isInForeground && e.scope == HotKeyScope.inapp) return false;
      return logicalKey != null && e.logicalKey == logicalKey && modifiers.length == (e.modifiers?.length ?? 0) && modifiers.every((e.modifiers ?? []).contains);
    }).toList();
    if (hotKeys.isNotEmpty) {
      for (final hotKey in hotKeys) {
        HotKeyHandler? handler = keyDownHandlerMap[hotKey.identifier];
        if (handler != null) handler(hotKey);
      }
      lastPressedHotKey = hotKeys.last;
    }
  }

  @override
  void onKeyRelease(LogicalKeyboardKey? key, HotKeyScope scope) {
    if (lastPressedHotKey != null) {
      HotKeyHandler? handler = keyUpHandlerMap[lastPressedHotKey!.identifier];
      if (handler != null) handler(lastPressedHotKey!);
      lastPressedHotKey = null;
      physicalKeyPressed.clear();
    }
  }

  @override
  void onMousePressed(RawButton key) {
    hotMouseKeyList.where((e) => key == HotkeyEntity.mouseKey2Button(e.key)).forEach((element) {
      if (element.scope == HotKeyScope.inapp && !isInForeground) return;
      HotMouseKeyHandler? handler = mouseKDownHandlerMap[element.identifier];
      if (handler != null) handler(element);
    });
  }

  @override
  void onMouseRelease(RawButton key) {
    hotMouseKeyList.where((e) => key == HotkeyEntity.mouseKey2Button(e.key)).forEach((element) {
      if (element.scope == HotKeyScope.system && !isInForeground) return;
      HotMouseKeyHandler? handler = mouseKeyUpHandlerMap[element.identifier];
      if (handler != null) handler(element);
    });
  }
}

final systemHokeyManager = _SystemHotkeyManager.instance;
