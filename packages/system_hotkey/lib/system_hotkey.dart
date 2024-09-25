library system_hotkey;

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hotkey_manager_platform_interface/hotkey_manager_platform_interface.dart';
import 'package:system_hotkey/src/rust/api/hotkey.dart';
import 'package:system_hotkey/src/rust/api/hotkey.entity.dart';
import 'package:system_hotkey/src/rust/api/listen.dart';
import 'package:system_hotkey/src/rust/frb_generated.dart';

export 'package:system_hotkey/src/rust/api/listen.dart';
export 'package:hotkey_manager_platform_interface/hotkey_manager_platform_interface.dart';

class _SystemHotkeyManager {
  // 单例
  static final _SystemHotkeyManager instance = _SystemHotkeyManager._internal();
  factory _SystemHotkeyManager() => instance;
  _SystemHotkeyManager._internal() {
    HardwareKeyboard.instance.addHandler(_handleInAppHotKeyEvent);
  }

  bool _isInit = false;

  Future<void> init() async {
    if (_isInit) return;
    await RustLib.init();
    _isInit = true;
  }

  final List<HotKey> _hotKeyList = [];
  final Map<String, HotKeyHandler> _keyDownHandlerMap = {};
  final Map<String, HotKeyHandler> _keyUpHandlerMap = {};

  Future<void> register(
    HotKey hotKey, {
    HotKeyHandler? keyDownHandler,
    HotKeyHandler? keyUpHandler,
  }) async {
    if (hotKey.scope == HotKeyScope.system) {
      // await _platform.register(hotKey);
      starter();
    }
    if (keyDownHandler != null) {
      _keyDownHandlerMap.update(
        hotKey.identifier,
        (_) => keyDownHandler,
        ifAbsent: () => keyDownHandler,
      );
    }
    if (keyUpHandler != null) {
      _keyUpHandlerMap.update(
        hotKey.identifier,
        (_) => keyUpHandler,
        ifAbsent: () => keyUpHandler,
      );
    }
    _hotKeyList.add(hotKey);
  }

  HotKey? _lastPressedHotKey;

  /// Unregister a hot key.
  Future<void> unregister(HotKey hotKey) async {
    if (hotKey.scope == HotKeyScope.system) {
      // await _platform.unregister(hotKey);
    }
    if (_keyDownHandlerMap.containsKey(hotKey.identifier)) {
      _keyDownHandlerMap.remove(hotKey.identifier);
    }
    if (_keyUpHandlerMap.containsKey(hotKey.identifier)) {
      _keyUpHandlerMap.remove(hotKey.identifier);
    }
    _hotKeyList.removeWhere((e) => e.identifier == hotKey.identifier);
  }

  /// Unregister all hot keys.
  Future<void> unregisterAll() async {
    // await _platform.unregisterAll();
    _keyDownHandlerMap.clear();
    _keyUpHandlerMap.clear();
    _hotKeyList.clear();
  }

  List<HotKey> get registeredHotKeyList => _hotKeyList;

  ShortcutListener? _shortcutListener;

  Future<ShortcutListener> starter() async {
    _shortcutListener ??= await startListener();
    _shortcutListener?.startListener(onEvent: (_) {}).listen((event) {
      if (event is RawEventType_KeyPress) {
        // 按下
        print("event==${event.field0}");
        LogicalKeyboardKey? logicalKey =
            HotkeyEntity.rawKey2LogicalKeyboardKey(event.field0);
        print('logicalKey==$logicalKey');

        final physicalKeysPressed =
            HardwareKeyboard.instance.physicalKeysPressed;

        print('physicalKeysPressed==${physicalKeysPressed.toList()}');
        final hotKeys = _hotKeyList.where((e) {
          List<HotKeyModifier> modifiers = HotKeyModifier.values
              .where((e) => e.physicalKeys.any(physicalKeysPressed.contains))
              .toList();
          return logicalKey != null &&
              e.scope == HotKeyScope.inapp &&
              e.logicalKey == logicalKey &&
              modifiers.length == (e.modifiers?.length ?? 0) &&
              modifiers.every((e.modifiers ?? []).contains);
        });
        if (hotKeys != null && hotKeys.isNotEmpty) {
          for (final hotKey in hotKeys) {
            HotKeyHandler? handler = _keyDownHandlerMap[hotKey.identifier];
            if (handler != null) handler(hotKey);
          }
          _lastPressedHotKey = hotKeys.last;
        }
      } else if (event is RawEventType_KeyRelease) {
        HotKeyHandler? handler =
            _keyUpHandlerMap[_lastPressedHotKey!.identifier];
        if (handler != null) handler(_lastPressedHotKey!);
        _lastPressedHotKey = null;
      }
    });
    return _shortcutListener!;
  }

  /// Handle in-app hot key event.
  bool _handleInAppHotKeyEvent(KeyEvent keyEvent) {
    if (_hotKeyList.where((e) => e.scope == HotKeyScope.inapp).isEmpty) {
      return false;
    }

    if (keyEvent is KeyUpEvent && _lastPressedHotKey != null) {
      HotKeyHandler? handler = _keyUpHandlerMap[_lastPressedHotKey!.identifier];
      if (handler != null) handler(_lastPressedHotKey!);
      _lastPressedHotKey = null;
      return true;
    }

    if (keyEvent is KeyRepeatEvent && _lastPressedHotKey != null) {
      return true;
    }

    if (keyEvent is KeyDownEvent) {
      final physicalKeysPressed = HardwareKeyboard.instance.physicalKeysPressed;
      final hotKeys = _hotKeyList.where((e) {
        List<HotKeyModifier> modifiers = HotKeyModifier.values
            .where((e) => e.physicalKeys.any(physicalKeysPressed.contains))
            .toList();
        return e.scope == HotKeyScope.inapp &&
            keyEvent.logicalKey == e.logicalKey &&
            modifiers.length == (e.modifiers?.length ?? 0) &&
            modifiers.every((e.modifiers ?? []).contains);
      });
      if (hotKeys.isNotEmpty) {
        for (final hotKey in hotKeys) {
          HotKeyHandler? handler = _keyDownHandlerMap[hotKey.identifier];
          if (handler != null) handler(hotKey);
        }
        _lastPressedHotKey = hotKeys.last;
        return true;
      }
    }
    return false;
  }

  Future<void> kill() async {
    if (!_isInit) {
      throw Exception(
          "You must call `await systemHokeyManager.init();` first.");
    }

    if (_shortcutListener != null) {
      await _shortcutListener!.stopListener();
    }
  }
}

final systemHokeyManager = _SystemHotkeyManager.instance;
