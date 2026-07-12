// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'js_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsValue {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is JsValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'JsValue()';
  }
}

/// @nodoc
class $JsValueCopyWith<$Res> {
  $JsValueCopyWith(JsValue _, $Res Function(JsValue) __);
}

/// Adds pattern-matching-related methods to [JsValue].
extension JsValuePatterns on JsValue {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsValue_None value)? none,
    TResult Function(JsValue_Boolean value)? boolean,
    TResult Function(JsValue_Integer value)? integer,
    TResult Function(JsValue_Float value)? float,
    TResult Function(JsValue_BigInt value)? bigInt,
    TResult Function(JsValue_String_ value)? string,
    TResult Function(JsValue_Bytes value)? bytes,
    TResult Function(JsValue_Array value)? array,
    TResult Function(JsValue_Object value)? object,
    TResult Function(JsValue_Date value)? date,
    TResult Function(JsValue_Symbol value)? symbol,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case JsValue_None() when none != null:
        return none(_that);
      case JsValue_Boolean() when boolean != null:
        return boolean(_that);
      case JsValue_Integer() when integer != null:
        return integer(_that);
      case JsValue_Float() when float != null:
        return float(_that);
      case JsValue_BigInt() when bigInt != null:
        return bigInt(_that);
      case JsValue_String_() when string != null:
        return string(_that);
      case JsValue_Bytes() when bytes != null:
        return bytes(_that);
      case JsValue_Array() when array != null:
        return array(_that);
      case JsValue_Object() when object != null:
        return object(_that);
      case JsValue_Date() when date != null:
        return date(_that);
      case JsValue_Symbol() when symbol != null:
        return symbol(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsValue_None value) none,
    required TResult Function(JsValue_Boolean value) boolean,
    required TResult Function(JsValue_Integer value) integer,
    required TResult Function(JsValue_Float value) float,
    required TResult Function(JsValue_BigInt value) bigInt,
    required TResult Function(JsValue_String_ value) string,
    required TResult Function(JsValue_Bytes value) bytes,
    required TResult Function(JsValue_Array value) array,
    required TResult Function(JsValue_Object value) object,
    required TResult Function(JsValue_Date value) date,
    required TResult Function(JsValue_Symbol value) symbol,
  }) {
    final _that = this;
    switch (_that) {
      case JsValue_None():
        return none(_that);
      case JsValue_Boolean():
        return boolean(_that);
      case JsValue_Integer():
        return integer(_that);
      case JsValue_Float():
        return float(_that);
      case JsValue_BigInt():
        return bigInt(_that);
      case JsValue_String_():
        return string(_that);
      case JsValue_Bytes():
        return bytes(_that);
      case JsValue_Array():
        return array(_that);
      case JsValue_Object():
        return object(_that);
      case JsValue_Date():
        return date(_that);
      case JsValue_Symbol():
        return symbol(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsValue_None value)? none,
    TResult? Function(JsValue_Boolean value)? boolean,
    TResult? Function(JsValue_Integer value)? integer,
    TResult? Function(JsValue_Float value)? float,
    TResult? Function(JsValue_BigInt value)? bigInt,
    TResult? Function(JsValue_String_ value)? string,
    TResult? Function(JsValue_Bytes value)? bytes,
    TResult? Function(JsValue_Array value)? array,
    TResult? Function(JsValue_Object value)? object,
    TResult? Function(JsValue_Date value)? date,
    TResult? Function(JsValue_Symbol value)? symbol,
  }) {
    final _that = this;
    switch (_that) {
      case JsValue_None() when none != null:
        return none(_that);
      case JsValue_Boolean() when boolean != null:
        return boolean(_that);
      case JsValue_Integer() when integer != null:
        return integer(_that);
      case JsValue_Float() when float != null:
        return float(_that);
      case JsValue_BigInt() when bigInt != null:
        return bigInt(_that);
      case JsValue_String_() when string != null:
        return string(_that);
      case JsValue_Bytes() when bytes != null:
        return bytes(_that);
      case JsValue_Array() when array != null:
        return array(_that);
      case JsValue_Object() when object != null:
        return object(_that);
      case JsValue_Date() when date != null:
        return date(_that);
      case JsValue_Symbol() when symbol != null:
        return symbol(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(bool field0)? boolean,
    TResult Function(PlatformInt64 field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? bigInt,
    TResult Function(String field0)? string,
    TResult Function(Uint8List field0)? bytes,
    TResult Function(List<JsValue> field0)? array,
    TResult Function(List<(String, JsValue)> field0)? object,
    TResult Function(PlatformInt64 field0)? date,
    TResult Function(String field0)? symbol,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case JsValue_None() when none != null:
        return none();
      case JsValue_Boolean() when boolean != null:
        return boolean(_that.field0);
      case JsValue_Integer() when integer != null:
        return integer(_that.field0);
      case JsValue_Float() when float != null:
        return float(_that.field0);
      case JsValue_BigInt() when bigInt != null:
        return bigInt(_that.field0);
      case JsValue_String_() when string != null:
        return string(_that.field0);
      case JsValue_Bytes() when bytes != null:
        return bytes(_that.field0);
      case JsValue_Array() when array != null:
        return array(_that.field0);
      case JsValue_Object() when object != null:
        return object(_that.field0);
      case JsValue_Date() when date != null:
        return date(_that.field0);
      case JsValue_Symbol() when symbol != null:
        return symbol(_that.field0);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(bool field0) boolean,
    required TResult Function(PlatformInt64 field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) bigInt,
    required TResult Function(String field0) string,
    required TResult Function(Uint8List field0) bytes,
    required TResult Function(List<JsValue> field0) array,
    required TResult Function(List<(String, JsValue)> field0) object,
    required TResult Function(PlatformInt64 field0) date,
    required TResult Function(String field0) symbol,
  }) {
    final _that = this;
    switch (_that) {
      case JsValue_None():
        return none();
      case JsValue_Boolean():
        return boolean(_that.field0);
      case JsValue_Integer():
        return integer(_that.field0);
      case JsValue_Float():
        return float(_that.field0);
      case JsValue_BigInt():
        return bigInt(_that.field0);
      case JsValue_String_():
        return string(_that.field0);
      case JsValue_Bytes():
        return bytes(_that.field0);
      case JsValue_Array():
        return array(_that.field0);
      case JsValue_Object():
        return object(_that.field0);
      case JsValue_Date():
        return date(_that.field0);
      case JsValue_Symbol():
        return symbol(_that.field0);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(bool field0)? boolean,
    TResult? Function(PlatformInt64 field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? bigInt,
    TResult? Function(String field0)? string,
    TResult? Function(Uint8List field0)? bytes,
    TResult? Function(List<JsValue> field0)? array,
    TResult? Function(List<(String, JsValue)> field0)? object,
    TResult? Function(PlatformInt64 field0)? date,
    TResult? Function(String field0)? symbol,
  }) {
    final _that = this;
    switch (_that) {
      case JsValue_None() when none != null:
        return none();
      case JsValue_Boolean() when boolean != null:
        return boolean(_that.field0);
      case JsValue_Integer() when integer != null:
        return integer(_that.field0);
      case JsValue_Float() when float != null:
        return float(_that.field0);
      case JsValue_BigInt() when bigInt != null:
        return bigInt(_that.field0);
      case JsValue_String_() when string != null:
        return string(_that.field0);
      case JsValue_Bytes() when bytes != null:
        return bytes(_that.field0);
      case JsValue_Array() when array != null:
        return array(_that.field0);
      case JsValue_Object() when object != null:
        return object(_that.field0);
      case JsValue_Date() when date != null:
        return date(_that.field0);
      case JsValue_Symbol() when symbol != null:
        return symbol(_that.field0);
      case _:
        return null;
    }
  }
}

/// @nodoc

class JsValue_None extends JsValue {
  const JsValue_None() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is JsValue_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'JsValue.none()';
  }
}

/// @nodoc

class JsValue_Boolean extends JsValue {
  const JsValue_Boolean(this.field0) : super._();

  final bool field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_BooleanCopyWith<JsValue_Boolean> get copyWith =>
      _$JsValue_BooleanCopyWithImpl<JsValue_Boolean>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Boolean &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.boolean(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_BooleanCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_BooleanCopyWith(
          JsValue_Boolean value, $Res Function(JsValue_Boolean) _then) =
      _$JsValue_BooleanCopyWithImpl;
  @useResult
  $Res call({bool field0});
}

/// @nodoc
class _$JsValue_BooleanCopyWithImpl<$Res>
    implements $JsValue_BooleanCopyWith<$Res> {
  _$JsValue_BooleanCopyWithImpl(this._self, this._then);

  final JsValue_Boolean _self;
  final $Res Function(JsValue_Boolean) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Boolean(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class JsValue_Integer extends JsValue {
  const JsValue_Integer(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_IntegerCopyWith<JsValue_Integer> get copyWith =>
      _$JsValue_IntegerCopyWithImpl<JsValue_Integer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Integer &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.integer(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_IntegerCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_IntegerCopyWith(
          JsValue_Integer value, $Res Function(JsValue_Integer) _then) =
      _$JsValue_IntegerCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$JsValue_IntegerCopyWithImpl<$Res>
    implements $JsValue_IntegerCopyWith<$Res> {
  _$JsValue_IntegerCopyWithImpl(this._self, this._then);

  final JsValue_Integer _self;
  final $Res Function(JsValue_Integer) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Integer(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class JsValue_Float extends JsValue {
  const JsValue_Float(this.field0) : super._();

  final double field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_FloatCopyWith<JsValue_Float> get copyWith =>
      _$JsValue_FloatCopyWithImpl<JsValue_Float>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Float &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.float(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_FloatCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_FloatCopyWith(
          JsValue_Float value, $Res Function(JsValue_Float) _then) =
      _$JsValue_FloatCopyWithImpl;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class _$JsValue_FloatCopyWithImpl<$Res>
    implements $JsValue_FloatCopyWith<$Res> {
  _$JsValue_FloatCopyWithImpl(this._self, this._then);

  final JsValue_Float _self;
  final $Res Function(JsValue_Float) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Float(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class JsValue_BigInt extends JsValue {
  const JsValue_BigInt(this.field0) : super._();

  final String field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_BigIntCopyWith<JsValue_BigInt> get copyWith =>
      _$JsValue_BigIntCopyWithImpl<JsValue_BigInt>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_BigInt &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.bigInt(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_BigIntCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_BigIntCopyWith(
          JsValue_BigInt value, $Res Function(JsValue_BigInt) _then) =
      _$JsValue_BigIntCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$JsValue_BigIntCopyWithImpl<$Res>
    implements $JsValue_BigIntCopyWith<$Res> {
  _$JsValue_BigIntCopyWithImpl(this._self, this._then);

  final JsValue_BigInt _self;
  final $Res Function(JsValue_BigInt) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_BigInt(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsValue_String_ extends JsValue {
  const JsValue_String_(this.field0) : super._();

  final String field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_String_CopyWith<JsValue_String_> get copyWith =>
      _$JsValue_String_CopyWithImpl<JsValue_String_>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_String_ &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.string(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_String_CopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_String_CopyWith(
          JsValue_String_ value, $Res Function(JsValue_String_) _then) =
      _$JsValue_String_CopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$JsValue_String_CopyWithImpl<$Res>
    implements $JsValue_String_CopyWith<$Res> {
  _$JsValue_String_CopyWithImpl(this._self, this._then);

  final JsValue_String_ _self;
  final $Res Function(JsValue_String_) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_String_(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsValue_Bytes extends JsValue {
  const JsValue_Bytes(this.field0) : super._();

  final Uint8List field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_BytesCopyWith<JsValue_Bytes> get copyWith =>
      _$JsValue_BytesCopyWithImpl<JsValue_Bytes>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Bytes &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'JsValue.bytes(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_BytesCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_BytesCopyWith(
          JsValue_Bytes value, $Res Function(JsValue_Bytes) _then) =
      _$JsValue_BytesCopyWithImpl;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class _$JsValue_BytesCopyWithImpl<$Res>
    implements $JsValue_BytesCopyWith<$Res> {
  _$JsValue_BytesCopyWithImpl(this._self, this._then);

  final JsValue_Bytes _self;
  final $Res Function(JsValue_Bytes) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Bytes(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class JsValue_Array extends JsValue {
  const JsValue_Array(final List<JsValue> field0)
      : _field0 = field0,
        super._();

  final List<JsValue> _field0;
  List<JsValue> get field0 {
    if (_field0 is EqualUnmodifiableListView) return _field0;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_field0);
  }

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_ArrayCopyWith<JsValue_Array> get copyWith =>
      _$JsValue_ArrayCopyWithImpl<JsValue_Array>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Array &&
            const DeepCollectionEquality().equals(other._field0, _field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_field0));

  @override
  String toString() {
    return 'JsValue.array(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_ArrayCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_ArrayCopyWith(
          JsValue_Array value, $Res Function(JsValue_Array) _then) =
      _$JsValue_ArrayCopyWithImpl;
  @useResult
  $Res call({List<JsValue> field0});
}

/// @nodoc
class _$JsValue_ArrayCopyWithImpl<$Res>
    implements $JsValue_ArrayCopyWith<$Res> {
  _$JsValue_ArrayCopyWithImpl(this._self, this._then);

  final JsValue_Array _self;
  final $Res Function(JsValue_Array) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Array(
      null == field0
          ? _self._field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as List<JsValue>,
    ));
  }
}

/// @nodoc

class JsValue_Object extends JsValue {
  const JsValue_Object(final List<(String, JsValue)> field0)
      : _field0 = field0,
        super._();

  final List<(String, JsValue)> _field0;
  List<(String, JsValue)> get field0 {
    if (_field0 is EqualUnmodifiableListView) return _field0;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_field0);
  }

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_ObjectCopyWith<JsValue_Object> get copyWith =>
      _$JsValue_ObjectCopyWithImpl<JsValue_Object>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Object &&
            const DeepCollectionEquality().equals(other._field0, _field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_field0));

  @override
  String toString() {
    return 'JsValue.object(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_ObjectCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_ObjectCopyWith(
          JsValue_Object value, $Res Function(JsValue_Object) _then) =
      _$JsValue_ObjectCopyWithImpl;
  @useResult
  $Res call({List<(String, JsValue)> field0});
}

/// @nodoc
class _$JsValue_ObjectCopyWithImpl<$Res>
    implements $JsValue_ObjectCopyWith<$Res> {
  _$JsValue_ObjectCopyWithImpl(this._self, this._then);

  final JsValue_Object _self;
  final $Res Function(JsValue_Object) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Object(
      null == field0
          ? _self._field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as List<(String, JsValue)>,
    ));
  }
}

/// @nodoc

class JsValue_Date extends JsValue {
  const JsValue_Date(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_DateCopyWith<JsValue_Date> get copyWith =>
      _$JsValue_DateCopyWithImpl<JsValue_Date>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Date &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.date(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_DateCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_DateCopyWith(
          JsValue_Date value, $Res Function(JsValue_Date) _then) =
      _$JsValue_DateCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$JsValue_DateCopyWithImpl<$Res> implements $JsValue_DateCopyWith<$Res> {
  _$JsValue_DateCopyWithImpl(this._self, this._then);

  final JsValue_Date _self;
  final $Res Function(JsValue_Date) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Date(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class JsValue_Symbol extends JsValue {
  const JsValue_Symbol(this.field0) : super._();

  final String field0;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsValue_SymbolCopyWith<JsValue_Symbol> get copyWith =>
      _$JsValue_SymbolCopyWithImpl<JsValue_Symbol>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsValue_Symbol &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'JsValue.symbol(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $JsValue_SymbolCopyWith<$Res>
    implements $JsValueCopyWith<$Res> {
  factory $JsValue_SymbolCopyWith(
          JsValue_Symbol value, $Res Function(JsValue_Symbol) _then) =
      _$JsValue_SymbolCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$JsValue_SymbolCopyWithImpl<$Res>
    implements $JsValue_SymbolCopyWith<$Res> {
  _$JsValue_SymbolCopyWithImpl(this._self, this._then);

  final JsValue_Symbol _self;
  final $Res Function(JsValue_Symbol) _then;

  /// Create a copy of JsValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(JsValue_Symbol(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
