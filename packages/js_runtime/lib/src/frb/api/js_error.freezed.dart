// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'js_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsError {
  String get message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsErrorCopyWith<JsError> get copyWith =>
      _$JsErrorCopyWithImpl<JsError>(this as JsError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsErrorCopyWith<$Res> {
  factory $JsErrorCopyWith(JsError value, $Res Function(JsError) _then) =
      _$JsErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsErrorCopyWithImpl<$Res> implements $JsErrorCopyWith<$Res> {
  _$JsErrorCopyWithImpl(this._self, this._then);

  final JsError _self;
  final $Res Function(JsError) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [JsError].
extension JsErrorPatterns on JsError {
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
    TResult Function(JsError_Syntax value)? syntax,
    TResult Function(JsError_Type value)? type,
    TResult Function(JsError_Reference value)? reference,
    TResult Function(JsError_Runtime value)? runtime,
    TResult Function(JsError_MemoryLimit value)? memoryLimit,
    TResult Function(JsError_StackOverflow value)? stackOverflow,
    TResult Function(JsError_Internal value)? internal,
    TResult Function(JsError_Cancelled value)? cancelled,
    TResult Function(JsError_Generic value)? generic,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case JsError_Syntax() when syntax != null:
        return syntax(_that);
      case JsError_Type() when type != null:
        return type(_that);
      case JsError_Reference() when reference != null:
        return reference(_that);
      case JsError_Runtime() when runtime != null:
        return runtime(_that);
      case JsError_MemoryLimit() when memoryLimit != null:
        return memoryLimit(_that);
      case JsError_StackOverflow() when stackOverflow != null:
        return stackOverflow(_that);
      case JsError_Internal() when internal != null:
        return internal(_that);
      case JsError_Cancelled() when cancelled != null:
        return cancelled(_that);
      case JsError_Generic() when generic != null:
        return generic(_that);
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
    required TResult Function(JsError_Syntax value) syntax,
    required TResult Function(JsError_Type value) type,
    required TResult Function(JsError_Reference value) reference,
    required TResult Function(JsError_Runtime value) runtime,
    required TResult Function(JsError_MemoryLimit value) memoryLimit,
    required TResult Function(JsError_StackOverflow value) stackOverflow,
    required TResult Function(JsError_Internal value) internal,
    required TResult Function(JsError_Cancelled value) cancelled,
    required TResult Function(JsError_Generic value) generic,
  }) {
    final _that = this;
    switch (_that) {
      case JsError_Syntax():
        return syntax(_that);
      case JsError_Type():
        return type(_that);
      case JsError_Reference():
        return reference(_that);
      case JsError_Runtime():
        return runtime(_that);
      case JsError_MemoryLimit():
        return memoryLimit(_that);
      case JsError_StackOverflow():
        return stackOverflow(_that);
      case JsError_Internal():
        return internal(_that);
      case JsError_Cancelled():
        return cancelled(_that);
      case JsError_Generic():
        return generic(_that);
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
    TResult? Function(JsError_Syntax value)? syntax,
    TResult? Function(JsError_Type value)? type,
    TResult? Function(JsError_Reference value)? reference,
    TResult? Function(JsError_Runtime value)? runtime,
    TResult? Function(JsError_MemoryLimit value)? memoryLimit,
    TResult? Function(JsError_StackOverflow value)? stackOverflow,
    TResult? Function(JsError_Internal value)? internal,
    TResult? Function(JsError_Cancelled value)? cancelled,
    TResult? Function(JsError_Generic value)? generic,
  }) {
    final _that = this;
    switch (_that) {
      case JsError_Syntax() when syntax != null:
        return syntax(_that);
      case JsError_Type() when type != null:
        return type(_that);
      case JsError_Reference() when reference != null:
        return reference(_that);
      case JsError_Runtime() when runtime != null:
        return runtime(_that);
      case JsError_MemoryLimit() when memoryLimit != null:
        return memoryLimit(_that);
      case JsError_StackOverflow() when stackOverflow != null:
        return stackOverflow(_that);
      case JsError_Internal() when internal != null:
        return internal(_that);
      case JsError_Cancelled() when cancelled != null:
        return cancelled(_that);
      case JsError_Generic() when generic != null:
        return generic(_that);
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
    TResult Function(String message, int? line, int? column)? syntax,
    TResult Function(String message)? type,
    TResult Function(String message)? reference,
    TResult Function(String message)? runtime,
    TResult Function(String message)? memoryLimit,
    TResult Function(String message)? stackOverflow,
    TResult Function(String message)? internal,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? generic,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case JsError_Syntax() when syntax != null:
        return syntax(_that.message, _that.line, _that.column);
      case JsError_Type() when type != null:
        return type(_that.message);
      case JsError_Reference() when reference != null:
        return reference(_that.message);
      case JsError_Runtime() when runtime != null:
        return runtime(_that.message);
      case JsError_MemoryLimit() when memoryLimit != null:
        return memoryLimit(_that.message);
      case JsError_StackOverflow() when stackOverflow != null:
        return stackOverflow(_that.message);
      case JsError_Internal() when internal != null:
        return internal(_that.message);
      case JsError_Cancelled() when cancelled != null:
        return cancelled(_that.message);
      case JsError_Generic() when generic != null:
        return generic(_that.message);
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
    required TResult Function(String message, int? line, int? column) syntax,
    required TResult Function(String message) type,
    required TResult Function(String message) reference,
    required TResult Function(String message) runtime,
    required TResult Function(String message) memoryLimit,
    required TResult Function(String message) stackOverflow,
    required TResult Function(String message) internal,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) generic,
  }) {
    final _that = this;
    switch (_that) {
      case JsError_Syntax():
        return syntax(_that.message, _that.line, _that.column);
      case JsError_Type():
        return type(_that.message);
      case JsError_Reference():
        return reference(_that.message);
      case JsError_Runtime():
        return runtime(_that.message);
      case JsError_MemoryLimit():
        return memoryLimit(_that.message);
      case JsError_StackOverflow():
        return stackOverflow(_that.message);
      case JsError_Internal():
        return internal(_that.message);
      case JsError_Cancelled():
        return cancelled(_that.message);
      case JsError_Generic():
        return generic(_that.message);
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
    TResult? Function(String message, int? line, int? column)? syntax,
    TResult? Function(String message)? type,
    TResult? Function(String message)? reference,
    TResult? Function(String message)? runtime,
    TResult? Function(String message)? memoryLimit,
    TResult? Function(String message)? stackOverflow,
    TResult? Function(String message)? internal,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? generic,
  }) {
    final _that = this;
    switch (_that) {
      case JsError_Syntax() when syntax != null:
        return syntax(_that.message, _that.line, _that.column);
      case JsError_Type() when type != null:
        return type(_that.message);
      case JsError_Reference() when reference != null:
        return reference(_that.message);
      case JsError_Runtime() when runtime != null:
        return runtime(_that.message);
      case JsError_MemoryLimit() when memoryLimit != null:
        return memoryLimit(_that.message);
      case JsError_StackOverflow() when stackOverflow != null:
        return stackOverflow(_that.message);
      case JsError_Internal() when internal != null:
        return internal(_that.message);
      case JsError_Cancelled() when cancelled != null:
        return cancelled(_that.message);
      case JsError_Generic() when generic != null:
        return generic(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class JsError_Syntax extends JsError {
  const JsError_Syntax({required this.message, this.line, this.column})
      : super._();

  @override
  final String message;
  final int? line;
  final int? column;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_SyntaxCopyWith<JsError_Syntax> get copyWith =>
      _$JsError_SyntaxCopyWithImpl<JsError_Syntax>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Syntax &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.column, column) || other.column == column));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, line, column);

  @override
  String toString() {
    return 'JsError.syntax(message: $message, line: $line, column: $column)';
  }
}

/// @nodoc
abstract mixin class $JsError_SyntaxCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_SyntaxCopyWith(
          JsError_Syntax value, $Res Function(JsError_Syntax) _then) =
      _$JsError_SyntaxCopyWithImpl;
  @override
  @useResult
  $Res call({String message, int? line, int? column});
}

/// @nodoc
class _$JsError_SyntaxCopyWithImpl<$Res>
    implements $JsError_SyntaxCopyWith<$Res> {
  _$JsError_SyntaxCopyWithImpl(this._self, this._then);

  final JsError_Syntax _self;
  final $Res Function(JsError_Syntax) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? line = freezed,
    Object? column = freezed,
  }) {
    return _then(JsError_Syntax(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      line: freezed == line
          ? _self.line
          : line // ignore: cast_nullable_to_non_nullable
              as int?,
      column: freezed == column
          ? _self.column
          : column // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class JsError_Type extends JsError {
  const JsError_Type({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_TypeCopyWith<JsError_Type> get copyWith =>
      _$JsError_TypeCopyWithImpl<JsError_Type>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Type &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.type(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_TypeCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_TypeCopyWith(
          JsError_Type value, $Res Function(JsError_Type) _then) =
      _$JsError_TypeCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_TypeCopyWithImpl<$Res> implements $JsError_TypeCopyWith<$Res> {
  _$JsError_TypeCopyWithImpl(this._self, this._then);

  final JsError_Type _self;
  final $Res Function(JsError_Type) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_Type(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_Reference extends JsError {
  const JsError_Reference({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_ReferenceCopyWith<JsError_Reference> get copyWith =>
      _$JsError_ReferenceCopyWithImpl<JsError_Reference>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Reference &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.reference(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_ReferenceCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_ReferenceCopyWith(
          JsError_Reference value, $Res Function(JsError_Reference) _then) =
      _$JsError_ReferenceCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_ReferenceCopyWithImpl<$Res>
    implements $JsError_ReferenceCopyWith<$Res> {
  _$JsError_ReferenceCopyWithImpl(this._self, this._then);

  final JsError_Reference _self;
  final $Res Function(JsError_Reference) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_Reference(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_Runtime extends JsError {
  const JsError_Runtime({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_RuntimeCopyWith<JsError_Runtime> get copyWith =>
      _$JsError_RuntimeCopyWithImpl<JsError_Runtime>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Runtime &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.runtime(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_RuntimeCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_RuntimeCopyWith(
          JsError_Runtime value, $Res Function(JsError_Runtime) _then) =
      _$JsError_RuntimeCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_RuntimeCopyWithImpl<$Res>
    implements $JsError_RuntimeCopyWith<$Res> {
  _$JsError_RuntimeCopyWithImpl(this._self, this._then);

  final JsError_Runtime _self;
  final $Res Function(JsError_Runtime) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_Runtime(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_MemoryLimit extends JsError {
  const JsError_MemoryLimit({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_MemoryLimitCopyWith<JsError_MemoryLimit> get copyWith =>
      _$JsError_MemoryLimitCopyWithImpl<JsError_MemoryLimit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_MemoryLimit &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.memoryLimit(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_MemoryLimitCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_MemoryLimitCopyWith(
          JsError_MemoryLimit value, $Res Function(JsError_MemoryLimit) _then) =
      _$JsError_MemoryLimitCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_MemoryLimitCopyWithImpl<$Res>
    implements $JsError_MemoryLimitCopyWith<$Res> {
  _$JsError_MemoryLimitCopyWithImpl(this._self, this._then);

  final JsError_MemoryLimit _self;
  final $Res Function(JsError_MemoryLimit) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_MemoryLimit(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_StackOverflow extends JsError {
  const JsError_StackOverflow({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_StackOverflowCopyWith<JsError_StackOverflow> get copyWith =>
      _$JsError_StackOverflowCopyWithImpl<JsError_StackOverflow>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_StackOverflow &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.stackOverflow(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_StackOverflowCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_StackOverflowCopyWith(JsError_StackOverflow value,
          $Res Function(JsError_StackOverflow) _then) =
      _$JsError_StackOverflowCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_StackOverflowCopyWithImpl<$Res>
    implements $JsError_StackOverflowCopyWith<$Res> {
  _$JsError_StackOverflowCopyWithImpl(this._self, this._then);

  final JsError_StackOverflow _self;
  final $Res Function(JsError_StackOverflow) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_StackOverflow(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_Internal extends JsError {
  const JsError_Internal({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_InternalCopyWith<JsError_Internal> get copyWith =>
      _$JsError_InternalCopyWithImpl<JsError_Internal>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Internal &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.internal(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_InternalCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_InternalCopyWith(
          JsError_Internal value, $Res Function(JsError_Internal) _then) =
      _$JsError_InternalCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_InternalCopyWithImpl<$Res>
    implements $JsError_InternalCopyWith<$Res> {
  _$JsError_InternalCopyWithImpl(this._self, this._then);

  final JsError_Internal _self;
  final $Res Function(JsError_Internal) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_Internal(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_Cancelled extends JsError {
  const JsError_Cancelled({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_CancelledCopyWith<JsError_Cancelled> get copyWith =>
      _$JsError_CancelledCopyWithImpl<JsError_Cancelled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Cancelled &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.cancelled(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_CancelledCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_CancelledCopyWith(
          JsError_Cancelled value, $Res Function(JsError_Cancelled) _then) =
      _$JsError_CancelledCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_CancelledCopyWithImpl<$Res>
    implements $JsError_CancelledCopyWith<$Res> {
  _$JsError_CancelledCopyWithImpl(this._self, this._then);

  final JsError_Cancelled _self;
  final $Res Function(JsError_Cancelled) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_Cancelled(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JsError_Generic extends JsError {
  const JsError_Generic({required this.message}) : super._();

  @override
  final String message;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsError_GenericCopyWith<JsError_Generic> get copyWith =>
      _$JsError_GenericCopyWithImpl<JsError_Generic>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsError_Generic &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'JsError.generic(message: $message)';
  }
}

/// @nodoc
abstract mixin class $JsError_GenericCopyWith<$Res>
    implements $JsErrorCopyWith<$Res> {
  factory $JsError_GenericCopyWith(
          JsError_Generic value, $Res Function(JsError_Generic) _then) =
      _$JsError_GenericCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$JsError_GenericCopyWithImpl<$Res>
    implements $JsError_GenericCopyWith<$Res> {
  _$JsError_GenericCopyWithImpl(this._self, this._then);

  final JsError_Generic _self;
  final $Res Function(JsError_Generic) _then;

  /// Create a copy of JsError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(JsError_Generic(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
