import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:system_hotkey/system_hotkey.dart';

const _uuid = Uuid();

class HotMouseKey {
  HotMouseKey({
    String? identifier,
    required this.key,
    this.scope = HotKeyScope.system,
  }) : identifier = identifier ?? _uuid.v4();

  final String identifier;
  final MouseKey key;
  final HotKeyScope scope;
}

enum MouseKey {
  left,
  right,
  middle,
}

typedef HotMouseKeyHandler = void Function(HotMouseKey hotKey);

class HotkeyEntity {
  static RawButton? mouseKey2Button(MouseKey key) {
    switch (key) {
      case MouseKey.left:
        return const RawButton_Left();
      case MouseKey.right:
        return const RawButton_Right();
      case MouseKey.middle:
        return const RawButton_Middle();
      default:
        return const RawButton.unknown(0);
    }
  }

  static PhysicalKeyboardKey? rawKey2PhysicalKeyboardKey(RawKey key) {
    switch (key) {
      case RawKey_Alt():
        return PhysicalKeyboardKey.altLeft;
      case RawKey_ControlLeft():
        return PhysicalKeyboardKey.controlLeft;
      case RawKey_ControlRight():
        return PhysicalKeyboardKey.controlRight;
      case RawKey_ShiftLeft():
        return PhysicalKeyboardKey.shiftLeft;
      case RawKey_ShiftRight():
        return PhysicalKeyboardKey.shiftRight;
      case RawKey_MetaRight():
        return PhysicalKeyboardKey.metaRight;
      case RawKey_MetaLeft():
        return PhysicalKeyboardKey.metaLeft;
      case RawKey_CapsLock():
        return PhysicalKeyboardKey.capsLock;
      case RawKey_Function():
        return PhysicalKeyboardKey.fn;

      default:
        return null;
    }
  }

  static LogicalKeyboardKey? rawKey2LogicalKeyboardKey(RawKey key) {
    switch (key) {
      case RawKey_Alt():
        return LogicalKeyboardKey.alt;
      case RawKey_AltGr():
        return LogicalKeyboardKey.altGraph;
      case RawKey_ControlLeft():
        return LogicalKeyboardKey.controlLeft;
      case RawKey_ControlRight():
        return LogicalKeyboardKey.controlRight;
      case RawKey_ShiftLeft():
        return LogicalKeyboardKey.shiftLeft;
      case RawKey_ShiftRight():
        return LogicalKeyboardKey.shiftRight;
      case RawKey_MetaRight():
      case RawKey_MetaLeft():
        return LogicalKeyboardKey.meta;
      case RawKey_Escape():
        return LogicalKeyboardKey.escape;
      case RawKey_Space():
        return LogicalKeyboardKey.space;
      case RawKey_Backspace():
        return LogicalKeyboardKey.backspace;
      case RawKey_Tab():
        return LogicalKeyboardKey.tab;
      case RawKey_Delete():
        return LogicalKeyboardKey.delete;
      case RawKey_UpArrow():
        return LogicalKeyboardKey.arrowUp;
      case RawKey_DownArrow():
        return LogicalKeyboardKey.arrowDown;
      case RawKey_LeftArrow():
        return LogicalKeyboardKey.arrowLeft;
      case RawKey_RightArrow():
        return LogicalKeyboardKey.arrowRight;
      case RawKey_F1():
        return LogicalKeyboardKey.f1;
      case RawKey_F2():
        return LogicalKeyboardKey.f2;
      case RawKey_F3():
        return LogicalKeyboardKey.f3;
      case RawKey_F4():
        return LogicalKeyboardKey.f4;
      case RawKey_F5():
        return LogicalKeyboardKey.f5;
      case RawKey_F6():
        return LogicalKeyboardKey.f6;
      case RawKey_F7():
        return LogicalKeyboardKey.f7;
      case RawKey_F8():
        return LogicalKeyboardKey.f8;
      case RawKey_F9():
        return LogicalKeyboardKey.f9;
      case RawKey_F10():
        return LogicalKeyboardKey.f10;
      case RawKey_F11():
        return LogicalKeyboardKey.f11;
      case RawKey_F12():
        return LogicalKeyboardKey.f12;
      case RawKey_Home():
        return LogicalKeyboardKey.home;
      case RawKey_End():
        return LogicalKeyboardKey.end;
      case RawKey_PageUp():
        return LogicalKeyboardKey.pageUp;
      case RawKey_PageDown():
        return LogicalKeyboardKey.pageDown;
      case RawKey_Return():
        return LogicalKeyboardKey.enter;
      case RawKey_CapsLock():
        return LogicalKeyboardKey.capsLock;
      case RawKey_NumLock():
        return LogicalKeyboardKey.numLock;
      case RawKey_ScrollLock():
        return LogicalKeyboardKey.scrollLock;
      case RawKey_Function():
        return LogicalKeyboardKey.fn;
      case RawKey_Pause():
        return LogicalKeyboardKey.pause;
      case RawKey_PrintScreen():
        return LogicalKeyboardKey.printScreen;
      case RawKey_Num1():
        return LogicalKeyboardKey.numpad1;
      case RawKey_Num2():
        return LogicalKeyboardKey.numpad2;
      case RawKey_Num3():
        return LogicalKeyboardKey.numpad3;
      case RawKey_Num4():
        return LogicalKeyboardKey.numpad4;
      case RawKey_Num5():
        return LogicalKeyboardKey.numpad5;
      case RawKey_Num6():
        return LogicalKeyboardKey.numpad6;
      case RawKey_Num7():
        return LogicalKeyboardKey.numpad7;
      case RawKey_Num8():
        return LogicalKeyboardKey.numpad8;
      case RawKey_Num9():
        return LogicalKeyboardKey.numpad9;
      case RawKey_Num0():
        return LogicalKeyboardKey.numpad0;
      case RawKey_Equal():
        return LogicalKeyboardKey.equal;
      case RawKey_Minus():
        return LogicalKeyboardKey.minus;
      case RawKey_LeftBracket():
        return LogicalKeyboardKey.bracketLeft;
      case RawKey_RightBracket():
        return LogicalKeyboardKey.bracketRight;
      case RawKey_SemiColon():
        return LogicalKeyboardKey.semicolon;
      case RawKey_Quote():
        return LogicalKeyboardKey.quote;
      case RawKey_Comma():
        return LogicalKeyboardKey.comma;
      case RawKey_Slash():
        return LogicalKeyboardKey.slash;
      case RawKey_BackSlash():
        return LogicalKeyboardKey.backslash;
      case RawKey_BackQuote():
        return LogicalKeyboardKey.backquote;
      case RawKey_Insert():
        return LogicalKeyboardKey.insert;
      case RawKey_KeyA():
        return LogicalKeyboardKey.keyA;
      case RawKey_KeyB():
        return LogicalKeyboardKey.keyB;
      case RawKey_KeyC():
        return LogicalKeyboardKey.keyC;
      case RawKey_KeyD():
        return LogicalKeyboardKey.keyD;
      case RawKey_KeyE():
        return LogicalKeyboardKey.keyE;
      case RawKey_KeyF():
        return LogicalKeyboardKey.keyF;
      case RawKey_KeyG():
        return LogicalKeyboardKey.keyG;
      case RawKey_KeyH():
        return LogicalKeyboardKey.keyH;
      case RawKey_KeyI():
        return LogicalKeyboardKey.keyI;
      case RawKey_KeyJ():
        return LogicalKeyboardKey.keyJ;
      case RawKey_KeyK():
        return LogicalKeyboardKey.keyK;
      case RawKey_KeyL():
        return LogicalKeyboardKey.keyL;
      case RawKey_KeyM():
        return LogicalKeyboardKey.keyM;
      case RawKey_KeyN():
        return LogicalKeyboardKey.keyN;
      case RawKey_KeyO():
        return LogicalKeyboardKey.keyO;
      case RawKey_KeyP():
        return LogicalKeyboardKey.keyP;
      case RawKey_KeyQ():
        return LogicalKeyboardKey.keyQ;
      case RawKey_KeyR():
        return LogicalKeyboardKey.keyR;
      case RawKey_KeyS():
        return LogicalKeyboardKey.keyS;
      case RawKey_KeyT():
        return LogicalKeyboardKey.keyT;
      case RawKey_KeyU():
        return LogicalKeyboardKey.keyU;
      case RawKey_KeyV():
        return LogicalKeyboardKey.keyV;
      case RawKey_KeyW():
        return LogicalKeyboardKey.keyW;
      case RawKey_KeyX():
        return LogicalKeyboardKey.keyX;
      case RawKey_KeyY():
        return LogicalKeyboardKey.keyY;
      case RawKey_KeyZ():
        return LogicalKeyboardKey.keyZ;
      case RawKey_IntlBackslash():
        return LogicalKeyboardKey.intlBackslash;
      case RawKey_Dot():
        return LogicalKeyboardKey.period;
      case RawKey_KpReturn():
        return LogicalKeyboardKey.numpadEnter;
      case RawKey_KpMinus():
        return LogicalKeyboardKey.numpadSubtract;
      case RawKey_KpPlus():
        return LogicalKeyboardKey.numpadAdd;
      case RawKey_KpMultiply():
        return LogicalKeyboardKey.numpadMultiply;
      default:
        return null; // 默认返回值
    }
  }
}
