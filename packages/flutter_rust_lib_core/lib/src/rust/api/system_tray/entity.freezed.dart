// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FFIIconEvent {
  /// Id of the tray icon which triggered this event.
  String get id => throw _privateConstructorUsedError;

  /// Physical Position of this event.
  FFIPhysicalPosition get position => throw _privateConstructorUsedError;

  /// Position and size of the tray icon.
  FFIRect get rect => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            FFIPhysicalPosition position,
            FFIRect rect,
            FFIMouseButton button,
            FFIMouseButtonState buttonState)
        click,
    required TResult Function(String id, FFIPhysicalPosition position,
            FFIRect rect, FFIMouseButton button)
        doubleClick,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        enter,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        move,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        leave,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FFIIconEvent_Click value) click,
    required TResult Function(FFIIconEvent_DoubleClick value) doubleClick,
    required TResult Function(FFIIconEvent_Enter value) enter,
    required TResult Function(FFIIconEvent_Move value) move,
    required TResult Function(FFIIconEvent_Leave value) leave,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FFIIconEvent_Click value)? click,
    TResult? Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult? Function(FFIIconEvent_Enter value)? enter,
    TResult? Function(FFIIconEvent_Move value)? move,
    TResult? Function(FFIIconEvent_Leave value)? leave,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FFIIconEvent_Click value)? click,
    TResult Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult Function(FFIIconEvent_Enter value)? enter,
    TResult Function(FFIIconEvent_Move value)? move,
    TResult Function(FFIIconEvent_Leave value)? leave,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FFIIconEventCopyWith<FFIIconEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FFIIconEventCopyWith<$Res> {
  factory $FFIIconEventCopyWith(
          FFIIconEvent value, $Res Function(FFIIconEvent) then) =
      _$FFIIconEventCopyWithImpl<$Res, FFIIconEvent>;
  @useResult
  $Res call({String id, FFIPhysicalPosition position, FFIRect rect});
}

/// @nodoc
class _$FFIIconEventCopyWithImpl<$Res, $Val extends FFIIconEvent>
    implements $FFIIconEventCopyWith<$Res> {
  _$FFIIconEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? rect = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as FFIPhysicalPosition,
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as FFIRect,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FFIIconEvent_ClickImplCopyWith<$Res>
    implements $FFIIconEventCopyWith<$Res> {
  factory _$$FFIIconEvent_ClickImplCopyWith(_$FFIIconEvent_ClickImpl value,
          $Res Function(_$FFIIconEvent_ClickImpl) then) =
      __$$FFIIconEvent_ClickImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      FFIPhysicalPosition position,
      FFIRect rect,
      FFIMouseButton button,
      FFIMouseButtonState buttonState});
}

/// @nodoc
class __$$FFIIconEvent_ClickImplCopyWithImpl<$Res>
    extends _$FFIIconEventCopyWithImpl<$Res, _$FFIIconEvent_ClickImpl>
    implements _$$FFIIconEvent_ClickImplCopyWith<$Res> {
  __$$FFIIconEvent_ClickImplCopyWithImpl(_$FFIIconEvent_ClickImpl _value,
      $Res Function(_$FFIIconEvent_ClickImpl) _then)
      : super(_value, _then);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? rect = null,
    Object? button = null,
    Object? buttonState = null,
  }) {
    return _then(_$FFIIconEvent_ClickImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as FFIPhysicalPosition,
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as FFIRect,
      button: null == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as FFIMouseButton,
      buttonState: null == buttonState
          ? _value.buttonState
          : buttonState // ignore: cast_nullable_to_non_nullable
              as FFIMouseButtonState,
    ));
  }
}

/// @nodoc

class _$FFIIconEvent_ClickImpl extends FFIIconEvent_Click {
  const _$FFIIconEvent_ClickImpl(
      {required this.id,
      required this.position,
      required this.rect,
      required this.button,
      required this.buttonState})
      : super._();

  /// Id of the tray icon which triggered this event.
  @override
  final String id;

  /// Physical Position of this event.
  @override
  final FFIPhysicalPosition position;

  /// Position and size of the tray icon.
  @override
  final FFIRect rect;

  /// Mouse button that triggered this event.
  @override
  final FFIMouseButton button;

  /// Mouse button state when this event was triggered.
  @override
  final FFIMouseButtonState buttonState;

  @override
  String toString() {
    return 'FFIIconEvent.click(id: $id, position: $position, rect: $rect, button: $button, buttonState: $buttonState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FFIIconEvent_ClickImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rect, rect) || other.rect == rect) &&
            (identical(other.button, button) || other.button == button) &&
            (identical(other.buttonState, buttonState) ||
                other.buttonState == buttonState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, position, rect, button, buttonState);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FFIIconEvent_ClickImplCopyWith<_$FFIIconEvent_ClickImpl> get copyWith =>
      __$$FFIIconEvent_ClickImplCopyWithImpl<_$FFIIconEvent_ClickImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            FFIPhysicalPosition position,
            FFIRect rect,
            FFIMouseButton button,
            FFIMouseButtonState buttonState)
        click,
    required TResult Function(String id, FFIPhysicalPosition position,
            FFIRect rect, FFIMouseButton button)
        doubleClick,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        enter,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        move,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        leave,
  }) {
    return click(id, position, rect, button, buttonState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
  }) {
    return click?.call(id, position, rect, button, buttonState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
    required TResult orElse(),
  }) {
    if (click != null) {
      return click(id, position, rect, button, buttonState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FFIIconEvent_Click value) click,
    required TResult Function(FFIIconEvent_DoubleClick value) doubleClick,
    required TResult Function(FFIIconEvent_Enter value) enter,
    required TResult Function(FFIIconEvent_Move value) move,
    required TResult Function(FFIIconEvent_Leave value) leave,
  }) {
    return click(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FFIIconEvent_Click value)? click,
    TResult? Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult? Function(FFIIconEvent_Enter value)? enter,
    TResult? Function(FFIIconEvent_Move value)? move,
    TResult? Function(FFIIconEvent_Leave value)? leave,
  }) {
    return click?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FFIIconEvent_Click value)? click,
    TResult Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult Function(FFIIconEvent_Enter value)? enter,
    TResult Function(FFIIconEvent_Move value)? move,
    TResult Function(FFIIconEvent_Leave value)? leave,
    required TResult orElse(),
  }) {
    if (click != null) {
      return click(this);
    }
    return orElse();
  }
}

abstract class FFIIconEvent_Click extends FFIIconEvent {
  const factory FFIIconEvent_Click(
          {required final String id,
          required final FFIPhysicalPosition position,
          required final FFIRect rect,
          required final FFIMouseButton button,
          required final FFIMouseButtonState buttonState}) =
      _$FFIIconEvent_ClickImpl;
  const FFIIconEvent_Click._() : super._();

  /// Id of the tray icon which triggered this event.
  @override
  String get id;

  /// Physical Position of this event.
  @override
  FFIPhysicalPosition get position;

  /// Position and size of the tray icon.
  @override
  FFIRect get rect;

  /// Mouse button that triggered this event.
  FFIMouseButton get button;

  /// Mouse button state when this event was triggered.
  FFIMouseButtonState get buttonState;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FFIIconEvent_ClickImplCopyWith<_$FFIIconEvent_ClickImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FFIIconEvent_DoubleClickImplCopyWith<$Res>
    implements $FFIIconEventCopyWith<$Res> {
  factory _$$FFIIconEvent_DoubleClickImplCopyWith(
          _$FFIIconEvent_DoubleClickImpl value,
          $Res Function(_$FFIIconEvent_DoubleClickImpl) then) =
      __$$FFIIconEvent_DoubleClickImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      FFIPhysicalPosition position,
      FFIRect rect,
      FFIMouseButton button});
}

/// @nodoc
class __$$FFIIconEvent_DoubleClickImplCopyWithImpl<$Res>
    extends _$FFIIconEventCopyWithImpl<$Res, _$FFIIconEvent_DoubleClickImpl>
    implements _$$FFIIconEvent_DoubleClickImplCopyWith<$Res> {
  __$$FFIIconEvent_DoubleClickImplCopyWithImpl(
      _$FFIIconEvent_DoubleClickImpl _value,
      $Res Function(_$FFIIconEvent_DoubleClickImpl) _then)
      : super(_value, _then);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? rect = null,
    Object? button = null,
  }) {
    return _then(_$FFIIconEvent_DoubleClickImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as FFIPhysicalPosition,
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as FFIRect,
      button: null == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as FFIMouseButton,
    ));
  }
}

/// @nodoc

class _$FFIIconEvent_DoubleClickImpl extends FFIIconEvent_DoubleClick {
  const _$FFIIconEvent_DoubleClickImpl(
      {required this.id,
      required this.position,
      required this.rect,
      required this.button})
      : super._();

  /// Id of the tray icon which triggered this event.
  @override
  final String id;

  /// Physical Position of this event.
  @override
  final FFIPhysicalPosition position;

  /// Position and size of the tray icon.
  @override
  final FFIRect rect;

  /// Mouse button that triggered this event.
  @override
  final FFIMouseButton button;

  @override
  String toString() {
    return 'FFIIconEvent.doubleClick(id: $id, position: $position, rect: $rect, button: $button)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FFIIconEvent_DoubleClickImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rect, rect) || other.rect == rect) &&
            (identical(other.button, button) || other.button == button));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, position, rect, button);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FFIIconEvent_DoubleClickImplCopyWith<_$FFIIconEvent_DoubleClickImpl>
      get copyWith => __$$FFIIconEvent_DoubleClickImplCopyWithImpl<
          _$FFIIconEvent_DoubleClickImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            FFIPhysicalPosition position,
            FFIRect rect,
            FFIMouseButton button,
            FFIMouseButtonState buttonState)
        click,
    required TResult Function(String id, FFIPhysicalPosition position,
            FFIRect rect, FFIMouseButton button)
        doubleClick,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        enter,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        move,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        leave,
  }) {
    return doubleClick(id, position, rect, button);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
  }) {
    return doubleClick?.call(id, position, rect, button);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
    required TResult orElse(),
  }) {
    if (doubleClick != null) {
      return doubleClick(id, position, rect, button);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FFIIconEvent_Click value) click,
    required TResult Function(FFIIconEvent_DoubleClick value) doubleClick,
    required TResult Function(FFIIconEvent_Enter value) enter,
    required TResult Function(FFIIconEvent_Move value) move,
    required TResult Function(FFIIconEvent_Leave value) leave,
  }) {
    return doubleClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FFIIconEvent_Click value)? click,
    TResult? Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult? Function(FFIIconEvent_Enter value)? enter,
    TResult? Function(FFIIconEvent_Move value)? move,
    TResult? Function(FFIIconEvent_Leave value)? leave,
  }) {
    return doubleClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FFIIconEvent_Click value)? click,
    TResult Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult Function(FFIIconEvent_Enter value)? enter,
    TResult Function(FFIIconEvent_Move value)? move,
    TResult Function(FFIIconEvent_Leave value)? leave,
    required TResult orElse(),
  }) {
    if (doubleClick != null) {
      return doubleClick(this);
    }
    return orElse();
  }
}

abstract class FFIIconEvent_DoubleClick extends FFIIconEvent {
  const factory FFIIconEvent_DoubleClick(
      {required final String id,
      required final FFIPhysicalPosition position,
      required final FFIRect rect,
      required final FFIMouseButton button}) = _$FFIIconEvent_DoubleClickImpl;
  const FFIIconEvent_DoubleClick._() : super._();

  /// Id of the tray icon which triggered this event.
  @override
  String get id;

  /// Physical Position of this event.
  @override
  FFIPhysicalPosition get position;

  /// Position and size of the tray icon.
  @override
  FFIRect get rect;

  /// Mouse button that triggered this event.
  FFIMouseButton get button;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FFIIconEvent_DoubleClickImplCopyWith<_$FFIIconEvent_DoubleClickImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FFIIconEvent_EnterImplCopyWith<$Res>
    implements $FFIIconEventCopyWith<$Res> {
  factory _$$FFIIconEvent_EnterImplCopyWith(_$FFIIconEvent_EnterImpl value,
          $Res Function(_$FFIIconEvent_EnterImpl) then) =
      __$$FFIIconEvent_EnterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, FFIPhysicalPosition position, FFIRect rect});
}

/// @nodoc
class __$$FFIIconEvent_EnterImplCopyWithImpl<$Res>
    extends _$FFIIconEventCopyWithImpl<$Res, _$FFIIconEvent_EnterImpl>
    implements _$$FFIIconEvent_EnterImplCopyWith<$Res> {
  __$$FFIIconEvent_EnterImplCopyWithImpl(_$FFIIconEvent_EnterImpl _value,
      $Res Function(_$FFIIconEvent_EnterImpl) _then)
      : super(_value, _then);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? rect = null,
  }) {
    return _then(_$FFIIconEvent_EnterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as FFIPhysicalPosition,
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as FFIRect,
    ));
  }
}

/// @nodoc

class _$FFIIconEvent_EnterImpl extends FFIIconEvent_Enter {
  const _$FFIIconEvent_EnterImpl(
      {required this.id, required this.position, required this.rect})
      : super._();

  /// Id of the tray icon which triggered this event.
  @override
  final String id;

  /// Physical Position of this event.
  @override
  final FFIPhysicalPosition position;

  /// Position and size of the tray icon.
  @override
  final FFIRect rect;

  @override
  String toString() {
    return 'FFIIconEvent.enter(id: $id, position: $position, rect: $rect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FFIIconEvent_EnterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rect, rect) || other.rect == rect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, position, rect);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FFIIconEvent_EnterImplCopyWith<_$FFIIconEvent_EnterImpl> get copyWith =>
      __$$FFIIconEvent_EnterImplCopyWithImpl<_$FFIIconEvent_EnterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            FFIPhysicalPosition position,
            FFIRect rect,
            FFIMouseButton button,
            FFIMouseButtonState buttonState)
        click,
    required TResult Function(String id, FFIPhysicalPosition position,
            FFIRect rect, FFIMouseButton button)
        doubleClick,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        enter,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        move,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        leave,
  }) {
    return enter(id, position, rect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
  }) {
    return enter?.call(id, position, rect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
    required TResult orElse(),
  }) {
    if (enter != null) {
      return enter(id, position, rect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FFIIconEvent_Click value) click,
    required TResult Function(FFIIconEvent_DoubleClick value) doubleClick,
    required TResult Function(FFIIconEvent_Enter value) enter,
    required TResult Function(FFIIconEvent_Move value) move,
    required TResult Function(FFIIconEvent_Leave value) leave,
  }) {
    return enter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FFIIconEvent_Click value)? click,
    TResult? Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult? Function(FFIIconEvent_Enter value)? enter,
    TResult? Function(FFIIconEvent_Move value)? move,
    TResult? Function(FFIIconEvent_Leave value)? leave,
  }) {
    return enter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FFIIconEvent_Click value)? click,
    TResult Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult Function(FFIIconEvent_Enter value)? enter,
    TResult Function(FFIIconEvent_Move value)? move,
    TResult Function(FFIIconEvent_Leave value)? leave,
    required TResult orElse(),
  }) {
    if (enter != null) {
      return enter(this);
    }
    return orElse();
  }
}

abstract class FFIIconEvent_Enter extends FFIIconEvent {
  const factory FFIIconEvent_Enter(
      {required final String id,
      required final FFIPhysicalPosition position,
      required final FFIRect rect}) = _$FFIIconEvent_EnterImpl;
  const FFIIconEvent_Enter._() : super._();

  /// Id of the tray icon which triggered this event.
  @override
  String get id;

  /// Physical Position of this event.
  @override
  FFIPhysicalPosition get position;

  /// Position and size of the tray icon.
  @override
  FFIRect get rect;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FFIIconEvent_EnterImplCopyWith<_$FFIIconEvent_EnterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FFIIconEvent_MoveImplCopyWith<$Res>
    implements $FFIIconEventCopyWith<$Res> {
  factory _$$FFIIconEvent_MoveImplCopyWith(_$FFIIconEvent_MoveImpl value,
          $Res Function(_$FFIIconEvent_MoveImpl) then) =
      __$$FFIIconEvent_MoveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, FFIPhysicalPosition position, FFIRect rect});
}

/// @nodoc
class __$$FFIIconEvent_MoveImplCopyWithImpl<$Res>
    extends _$FFIIconEventCopyWithImpl<$Res, _$FFIIconEvent_MoveImpl>
    implements _$$FFIIconEvent_MoveImplCopyWith<$Res> {
  __$$FFIIconEvent_MoveImplCopyWithImpl(_$FFIIconEvent_MoveImpl _value,
      $Res Function(_$FFIIconEvent_MoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? rect = null,
  }) {
    return _then(_$FFIIconEvent_MoveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as FFIPhysicalPosition,
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as FFIRect,
    ));
  }
}

/// @nodoc

class _$FFIIconEvent_MoveImpl extends FFIIconEvent_Move {
  const _$FFIIconEvent_MoveImpl(
      {required this.id, required this.position, required this.rect})
      : super._();

  /// Id of the tray icon which triggered this event.
  @override
  final String id;

  /// Physical Position of this event.
  @override
  final FFIPhysicalPosition position;

  /// Position and size of the tray icon.
  @override
  final FFIRect rect;

  @override
  String toString() {
    return 'FFIIconEvent.move(id: $id, position: $position, rect: $rect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FFIIconEvent_MoveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rect, rect) || other.rect == rect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, position, rect);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FFIIconEvent_MoveImplCopyWith<_$FFIIconEvent_MoveImpl> get copyWith =>
      __$$FFIIconEvent_MoveImplCopyWithImpl<_$FFIIconEvent_MoveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            FFIPhysicalPosition position,
            FFIRect rect,
            FFIMouseButton button,
            FFIMouseButtonState buttonState)
        click,
    required TResult Function(String id, FFIPhysicalPosition position,
            FFIRect rect, FFIMouseButton button)
        doubleClick,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        enter,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        move,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        leave,
  }) {
    return move(id, position, rect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
  }) {
    return move?.call(id, position, rect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
    required TResult orElse(),
  }) {
    if (move != null) {
      return move(id, position, rect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FFIIconEvent_Click value) click,
    required TResult Function(FFIIconEvent_DoubleClick value) doubleClick,
    required TResult Function(FFIIconEvent_Enter value) enter,
    required TResult Function(FFIIconEvent_Move value) move,
    required TResult Function(FFIIconEvent_Leave value) leave,
  }) {
    return move(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FFIIconEvent_Click value)? click,
    TResult? Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult? Function(FFIIconEvent_Enter value)? enter,
    TResult? Function(FFIIconEvent_Move value)? move,
    TResult? Function(FFIIconEvent_Leave value)? leave,
  }) {
    return move?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FFIIconEvent_Click value)? click,
    TResult Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult Function(FFIIconEvent_Enter value)? enter,
    TResult Function(FFIIconEvent_Move value)? move,
    TResult Function(FFIIconEvent_Leave value)? leave,
    required TResult orElse(),
  }) {
    if (move != null) {
      return move(this);
    }
    return orElse();
  }
}

abstract class FFIIconEvent_Move extends FFIIconEvent {
  const factory FFIIconEvent_Move(
      {required final String id,
      required final FFIPhysicalPosition position,
      required final FFIRect rect}) = _$FFIIconEvent_MoveImpl;
  const FFIIconEvent_Move._() : super._();

  /// Id of the tray icon which triggered this event.
  @override
  String get id;

  /// Physical Position of this event.
  @override
  FFIPhysicalPosition get position;

  /// Position and size of the tray icon.
  @override
  FFIRect get rect;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FFIIconEvent_MoveImplCopyWith<_$FFIIconEvent_MoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FFIIconEvent_LeaveImplCopyWith<$Res>
    implements $FFIIconEventCopyWith<$Res> {
  factory _$$FFIIconEvent_LeaveImplCopyWith(_$FFIIconEvent_LeaveImpl value,
          $Res Function(_$FFIIconEvent_LeaveImpl) then) =
      __$$FFIIconEvent_LeaveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, FFIPhysicalPosition position, FFIRect rect});
}

/// @nodoc
class __$$FFIIconEvent_LeaveImplCopyWithImpl<$Res>
    extends _$FFIIconEventCopyWithImpl<$Res, _$FFIIconEvent_LeaveImpl>
    implements _$$FFIIconEvent_LeaveImplCopyWith<$Res> {
  __$$FFIIconEvent_LeaveImplCopyWithImpl(_$FFIIconEvent_LeaveImpl _value,
      $Res Function(_$FFIIconEvent_LeaveImpl) _then)
      : super(_value, _then);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? rect = null,
  }) {
    return _then(_$FFIIconEvent_LeaveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as FFIPhysicalPosition,
      rect: null == rect
          ? _value.rect
          : rect // ignore: cast_nullable_to_non_nullable
              as FFIRect,
    ));
  }
}

/// @nodoc

class _$FFIIconEvent_LeaveImpl extends FFIIconEvent_Leave {
  const _$FFIIconEvent_LeaveImpl(
      {required this.id, required this.position, required this.rect})
      : super._();

  /// Id of the tray icon which triggered this event.
  @override
  final String id;

  /// Physical Position of this event.
  @override
  final FFIPhysicalPosition position;

  /// Position and size of the tray icon.
  @override
  final FFIRect rect;

  @override
  String toString() {
    return 'FFIIconEvent.leave(id: $id, position: $position, rect: $rect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FFIIconEvent_LeaveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rect, rect) || other.rect == rect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, position, rect);

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FFIIconEvent_LeaveImplCopyWith<_$FFIIconEvent_LeaveImpl> get copyWith =>
      __$$FFIIconEvent_LeaveImplCopyWithImpl<_$FFIIconEvent_LeaveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            FFIPhysicalPosition position,
            FFIRect rect,
            FFIMouseButton button,
            FFIMouseButtonState buttonState)
        click,
    required TResult Function(String id, FFIPhysicalPosition position,
            FFIRect rect, FFIMouseButton button)
        doubleClick,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        enter,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        move,
    required TResult Function(
            String id, FFIPhysicalPosition position, FFIRect rect)
        leave,
  }) {
    return leave(id, position, rect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult? Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
  }) {
    return leave?.call(id, position, rect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button, FFIMouseButtonState buttonState)?
        click,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect,
            FFIMouseButton button)?
        doubleClick,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        enter,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        move,
    TResult Function(String id, FFIPhysicalPosition position, FFIRect rect)?
        leave,
    required TResult orElse(),
  }) {
    if (leave != null) {
      return leave(id, position, rect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FFIIconEvent_Click value) click,
    required TResult Function(FFIIconEvent_DoubleClick value) doubleClick,
    required TResult Function(FFIIconEvent_Enter value) enter,
    required TResult Function(FFIIconEvent_Move value) move,
    required TResult Function(FFIIconEvent_Leave value) leave,
  }) {
    return leave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FFIIconEvent_Click value)? click,
    TResult? Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult? Function(FFIIconEvent_Enter value)? enter,
    TResult? Function(FFIIconEvent_Move value)? move,
    TResult? Function(FFIIconEvent_Leave value)? leave,
  }) {
    return leave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FFIIconEvent_Click value)? click,
    TResult Function(FFIIconEvent_DoubleClick value)? doubleClick,
    TResult Function(FFIIconEvent_Enter value)? enter,
    TResult Function(FFIIconEvent_Move value)? move,
    TResult Function(FFIIconEvent_Leave value)? leave,
    required TResult orElse(),
  }) {
    if (leave != null) {
      return leave(this);
    }
    return orElse();
  }
}

abstract class FFIIconEvent_Leave extends FFIIconEvent {
  const factory FFIIconEvent_Leave(
      {required final String id,
      required final FFIPhysicalPosition position,
      required final FFIRect rect}) = _$FFIIconEvent_LeaveImpl;
  const FFIIconEvent_Leave._() : super._();

  /// Id of the tray icon which triggered this event.
  @override
  String get id;

  /// Physical Position of this event.
  @override
  FFIPhysicalPosition get position;

  /// Position and size of the tray icon.
  @override
  FFIRect get rect;

  /// Create a copy of FFIIconEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FFIIconEvent_LeaveImplCopyWith<_$FFIIconEvent_LeaveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
