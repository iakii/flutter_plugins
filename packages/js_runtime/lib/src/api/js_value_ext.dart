//! JsValue 便利扩展方法。
//!
//! FRB 生成的 JsValue 是 freezed sealed class，
//! 此文件提供 Dart 端的静态构造器和类型判断辅助。

// ignore_for_file: unused_import

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:js_runtime/src/frb/api/js_value.dart';

/// JsValue 便利扩展。
extension JsValueExt on JsValue {
  // ─── 同步类型判断（无需 await） ──────────────────────

  /// 是否为 None（null 或 undefined）。
  bool get isNone => this is JsValue_None;

  /// 是否为 Boolean。
  bool get isBoolean => this is JsValue_Boolean;

  /// 是否为数字（Integer 或 Float）。
  bool get isNumber => this is JsValue_Integer || this is JsValue_Float;

  /// 是否为 Integer。
  bool get isInteger => this is JsValue_Integer;

  /// 是否为 Float。
  bool get isFloat => this is JsValue_Float;

  /// 是否为 BigInt。
  bool get isBigInt => this is JsValue_BigInt;

  /// 是否为字符串。
  bool get isString => this is JsValue_String_;

  /// 是否为 Bytes。
  bool get isBytes => this is JsValue_Bytes;

  /// 是否为数组。
  bool get isArray => this is JsValue_Array;

  /// 是否为对象。
  bool get isObject => this is JsValue_Object;

  /// 是否为 Date。
  bool get isDate => this is JsValue_Date;

  /// 是否为 Symbol。
  bool get isSymbol => this is JsValue_Symbol;

  /// 是否为原始类型。
  bool get isPrimitive =>
      this is JsValue_None ||
      this is JsValue_Boolean ||
      this is JsValue_Integer ||
      this is JsValue_Float ||
      this is JsValue_BigInt ||
      this is JsValue_String_ ||
      this is JsValue_Symbol;

  // ─── 同步取值（无需 await，直接模式匹配） ──────────

  /// 同步获取布尔值，仅当值为 Boolean 时返回。
  bool? get asBooleanSync =>
      switch (this) { JsValue_Boolean(:final field0) => field0, _ => null };

  /// 同步获取整数值，仅当值为 Integer 时返回。
  PlatformInt64? get asIntegerSync => switch (this) {
        JsValue_Integer(:final field0) => field0,
        _ => null
      };

  /// 同步获取浮点值，仅当值为 Float 时返回。
  double? get asFloatSync =>
      switch (this) { JsValue_Float(:final field0) => field0, _ => null };

  /// 同步获取数值（Integer 或 Float），统一转为 double。
  double? get asNumberSync => switch (this) {
        JsValue_Integer(:final field0) => field0.toDouble(),
        JsValue_Float(:final field0) => field0,
        _ => null
      };

  /// 同步获取字符串，仅当值为 String_ 时返回。
  String? get asStringSync =>
      switch (this) { JsValue_String_(:final field0) => field0, _ => null };

  /// 同步获取 BigInt 字符串，仅当值为 BigInt 时返回。
  String? get asBigIntSync =>
      switch (this) { JsValue_BigInt(:final field0) => field0, _ => null };

  /// 同步获取数组元素，仅当值为 Array 时返回。
  List<JsValue>? get asArraySync =>
      switch (this) { JsValue_Array(:final field0) => field0, _ => null };

  /// 同步获取对象键值对，仅当值为 Object 时返回。
  List<(String, JsValue)>? get asObjectSync =>
      switch (this) { JsValue_Object(:final field0) => field0, _ => null };

  /// 同步获取 Date 时间戳（毫秒），仅当值为 Date 时返回。
  PlatformInt64? get asDateSync =>
      switch (this) { JsValue_Date(:final field0) => field0, _ => null };

  /// 同步获取 Symbol 描述，仅当值为 Symbol 时返回。
  String? get asSymbolSync =>
      switch (this) { JsValue_Symbol(:final field0) => field0, _ => null };

  /// 将 Object 的键值对列表转换为 `Map<String, JsValue>`。
  Map<String, JsValue>? get asMapSync {
    final entries = asObjectSync;
    if (entries == null) return null;
    return {for (final (k, v) in entries) k: v};
  }
}
