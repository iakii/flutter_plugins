import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:system_hotkey/src/rust/frb_generated.dart';

import 'package:system_hotkey/system_hotkey.dart';

abstract class HotkeyLisener with WidgetsBindingObserver {
  bool _isInit = false;

  bool isInForeground = true;

  HotkeyLisener() {
    WidgetsBinding.instance.addObserver(this);
  }

  HotKeyManagerPlatform get _platform => HotKeyManagerPlatform.instance;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    isInForeground = state == AppLifecycleState.resumed;
  }

  Future<void> init() async {
    await RustLib.init();
    _isInit = true;
  }

  final List<HotKey> _hotKeyList = [];
  final Map<String, HotKeyHandler> keyDownHandlerMap = {};
  final Map<String, HotKeyHandler> keyUpHandlerMap = {};

  Future<void> register(
    HotKey hotKey, {
    HotKeyHandler? keyDownHandler,
    HotKeyHandler? keyUpHandler,
  }) async {
    if (hotKey.scope == HotKeyScope.system) {
      // await _platform.register(hotKey);
      await _platform.register(hotKey);
    }
    if (keyDownHandler != null) {
      keyDownHandlerMap.update(
        hotKey.identifier,
        (_) => keyDownHandler,
        ifAbsent: () => keyDownHandler,
      );
    }
    if (keyUpHandler != null) {
      keyUpHandlerMap.update(
        hotKey.identifier,
        (_) => keyUpHandler,
        ifAbsent: () => keyUpHandler,
      );
    }
    _hotKeyList.add(hotKey);

    if (_shortcutListener == null) await _starter();
  }

  HotKey? lastPressedHotKey;

  /// Unregister a hot key.
  Future<void> unregister(HotKey hotKey) async {
    if (hotKey.scope == HotKeyScope.system) {
      await _platform.unregister(hotKey);
    }
    if (keyDownHandlerMap.containsKey(hotKey.identifier)) {
      keyDownHandlerMap.remove(hotKey.identifier);
    }
    if (keyUpHandlerMap.containsKey(hotKey.identifier)) {
      keyUpHandlerMap.remove(hotKey.identifier);
    }
    _hotKeyList.removeWhere((e) => e.identifier == hotKey.identifier);
  }

  /// Unregister all hot keys.
  Future<void> unregisterAll() async {
    await _platform.unregisterAll();
    keyDownHandlerMap.clear();
    keyUpHandlerMap.clear();
    _hotKeyList.clear();
  }

  List<HotKey> get registeredHotKeyList => _hotKeyList;

  ShortcutListener? _shortcutListener;

  final Set<PhysicalKeyboardKey> physicalKeyPressed = {};

  Future<void> kill() async {
    WidgetsBinding.instance.removeObserver(this);

    if (!_isInit) {
      throw Exception("You must call `await systemHokeyManager.init();` first.");
    }

    if (_shortcutListener != null) {
      await _shortcutListener!.stopListener();
    }
  }

  final List<HotMouseKey> hotMouseKeyList = [];

  final Map<String, HotMouseKeyHandler> mouseKDownHandlerMap = {};
  final Map<String, HotMouseKeyHandler> mouseKeyUpHandlerMap = {};

  registerMouse(
    HotMouseKey hotKey, {
    HotMouseKeyHandler? keyDownHandler,
    HotMouseKeyHandler? keyUpHandler,
  }) {
    hotMouseKeyList.add(hotKey);

    if (keyDownHandler != null) {
      mouseKDownHandlerMap.update(
        hotKey.identifier,
        (_) => keyDownHandler,
        ifAbsent: () => keyDownHandler,
      );
    }
    if (keyUpHandler != null) {
      mouseKeyUpHandlerMap.update(
        hotKey.identifier,
        (_) => keyUpHandler,
        ifAbsent: () => keyUpHandler,
      );
    }

    if (_shortcutListener != null) {
      _starter();
    }
  }

  unregisterMouse() {
    hotMouseKeyList.clear();
    mouseKDownHandlerMap.clear();
    mouseKeyUpHandlerMap.clear();
  }

  Future<ShortcutListener> _starter() async {
    _shortcutListener ??= await startListener();
    _shortcutListener?.startListener(onEvent: (_) {}).listen((event) {
      // print('isInForeground===$isInForeground');
      if (event is RawEventType_ButtonPress) {
        onMousePressed(event.field0);
      } else if (event is RawEventType_ButtonRelease) {
        onMouseRelease(event.field0);
      } else if (event is RawEventType_KeyPress) {
        final physicalKey = HotkeyEntity.rawKey2PhysicalKeyboardKey(event.field0);
        if (physicalKey != null) {
          physicalKeyPressed.add(physicalKey);
        }
        LogicalKeyboardKey? logicalKey = HotkeyEntity.rawKey2LogicalKeyboardKey(event.field0);
        onKeyPress(logicalKey, HotKeyScope.system);
      } else if (event is RawEventType_KeyRelease) {
        LogicalKeyboardKey? logicalKey = HotkeyEntity.rawKey2LogicalKeyboardKey(event.field0);
        onKeyRelease(logicalKey, HotKeyScope.system);
      }
    });
    return _shortcutListener!;
  }

  void onMousePressed(RawButton key);
  void onMouseRelease(RawButton key);

  void onKeyRelease(LogicalKeyboardKey? key, HotKeyScope scope);
  void onKeyPress(LogicalKeyboardKey? key, HotKeyScope scope);
}
