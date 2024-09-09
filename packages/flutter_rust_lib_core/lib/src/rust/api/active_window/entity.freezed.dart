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
mixin _$IconEntity {
  String get data => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;

  /// Create a copy of IconEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IconEntityCopyWith<IconEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconEntityCopyWith<$Res> {
  factory $IconEntityCopyWith(
          IconEntity value, $Res Function(IconEntity) then) =
      _$IconEntityCopyWithImpl<$Res, IconEntity>;
  @useResult
  $Res call({String data, int height, int width});
}

/// @nodoc
class _$IconEntityCopyWithImpl<$Res, $Val extends IconEntity>
    implements $IconEntityCopyWith<$Res> {
  _$IconEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IconEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? height = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IconEntityImplCopyWith<$Res>
    implements $IconEntityCopyWith<$Res> {
  factory _$$IconEntityImplCopyWith(
          _$IconEntityImpl value, $Res Function(_$IconEntityImpl) then) =
      __$$IconEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String data, int height, int width});
}

/// @nodoc
class __$$IconEntityImplCopyWithImpl<$Res>
    extends _$IconEntityCopyWithImpl<$Res, _$IconEntityImpl>
    implements _$$IconEntityImplCopyWith<$Res> {
  __$$IconEntityImplCopyWithImpl(
      _$IconEntityImpl _value, $Res Function(_$IconEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of IconEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? height = null,
    Object? width = null,
  }) {
    return _then(_$IconEntityImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IconEntityImpl implements _IconEntity {
  const _$IconEntityImpl(
      {required this.data, required this.height, required this.width});

  @override
  final String data;
  @override
  final int height;
  @override
  final int width;

  @override
  String toString() {
    return 'IconEntity(data: $data, height: $height, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IconEntityImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, height, width);

  /// Create a copy of IconEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IconEntityImplCopyWith<_$IconEntityImpl> get copyWith =>
      __$$IconEntityImplCopyWithImpl<_$IconEntityImpl>(this, _$identity);
}

abstract class _IconEntity implements IconEntity {
  const factory _IconEntity(
      {required final String data,
      required final int height,
      required final int width}) = _$IconEntityImpl;

  @override
  String get data;
  @override
  int get height;
  @override
  int get width;

  /// Create a copy of IconEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IconEntityImplCopyWith<_$IconEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InfoEntity {
  int get processId => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get execName => throw _privateConstructorUsedError;

  /// Create a copy of InfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoEntityCopyWith<InfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoEntityCopyWith<$Res> {
  factory $InfoEntityCopyWith(
          InfoEntity value, $Res Function(InfoEntity) then) =
      _$InfoEntityCopyWithImpl<$Res, InfoEntity>;
  @useResult
  $Res call({int processId, String path, String name, String execName});
}

/// @nodoc
class _$InfoEntityCopyWithImpl<$Res, $Val extends InfoEntity>
    implements $InfoEntityCopyWith<$Res> {
  _$InfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processId = null,
    Object? path = null,
    Object? name = null,
    Object? execName = null,
  }) {
    return _then(_value.copyWith(
      processId: null == processId
          ? _value.processId
          : processId // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      execName: null == execName
          ? _value.execName
          : execName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoEntityImplCopyWith<$Res>
    implements $InfoEntityCopyWith<$Res> {
  factory _$$InfoEntityImplCopyWith(
          _$InfoEntityImpl value, $Res Function(_$InfoEntityImpl) then) =
      __$$InfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int processId, String path, String name, String execName});
}

/// @nodoc
class __$$InfoEntityImplCopyWithImpl<$Res>
    extends _$InfoEntityCopyWithImpl<$Res, _$InfoEntityImpl>
    implements _$$InfoEntityImplCopyWith<$Res> {
  __$$InfoEntityImplCopyWithImpl(
      _$InfoEntityImpl _value, $Res Function(_$InfoEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processId = null,
    Object? path = null,
    Object? name = null,
    Object? execName = null,
  }) {
    return _then(_$InfoEntityImpl(
      processId: null == processId
          ? _value.processId
          : processId // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      execName: null == execName
          ? _value.execName
          : execName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InfoEntityImpl implements _InfoEntity {
  const _$InfoEntityImpl(
      {required this.processId,
      required this.path,
      required this.name,
      required this.execName});

  @override
  final int processId;
  @override
  final String path;
  @override
  final String name;
  @override
  final String execName;

  @override
  String toString() {
    return 'InfoEntity(processId: $processId, path: $path, name: $name, execName: $execName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoEntityImpl &&
            (identical(other.processId, processId) ||
                other.processId == processId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.execName, execName) ||
                other.execName == execName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processId, path, name, execName);

  /// Create a copy of InfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoEntityImplCopyWith<_$InfoEntityImpl> get copyWith =>
      __$$InfoEntityImplCopyWithImpl<_$InfoEntityImpl>(this, _$identity);
}

abstract class _InfoEntity implements InfoEntity {
  const factory _InfoEntity(
      {required final int processId,
      required final String path,
      required final String name,
      required final String execName}) = _$InfoEntityImpl;

  @override
  int get processId;
  @override
  String get path;
  @override
  String get name;
  @override
  String get execName;

  /// Create a copy of InfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoEntityImplCopyWith<_$InfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PositionEntity {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  bool get isFullScreen => throw _privateConstructorUsedError;

  /// Create a copy of PositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionEntityCopyWith<PositionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionEntityCopyWith<$Res> {
  factory $PositionEntityCopyWith(
          PositionEntity value, $Res Function(PositionEntity) then) =
      _$PositionEntityCopyWithImpl<$Res, PositionEntity>;
  @useResult
  $Res call({int x, int y, int width, int height, bool isFullScreen});
}

/// @nodoc
class _$PositionEntityCopyWithImpl<$Res, $Val extends PositionEntity>
    implements $PositionEntityCopyWith<$Res> {
  _$PositionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? isFullScreen = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      isFullScreen: null == isFullScreen
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionEntityImplCopyWith<$Res>
    implements $PositionEntityCopyWith<$Res> {
  factory _$$PositionEntityImplCopyWith(_$PositionEntityImpl value,
          $Res Function(_$PositionEntityImpl) then) =
      __$$PositionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y, int width, int height, bool isFullScreen});
}

/// @nodoc
class __$$PositionEntityImplCopyWithImpl<$Res>
    extends _$PositionEntityCopyWithImpl<$Res, _$PositionEntityImpl>
    implements _$$PositionEntityImplCopyWith<$Res> {
  __$$PositionEntityImplCopyWithImpl(
      _$PositionEntityImpl _value, $Res Function(_$PositionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? isFullScreen = null,
  }) {
    return _then(_$PositionEntityImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      isFullScreen: null == isFullScreen
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PositionEntityImpl implements _PositionEntity {
  const _$PositionEntityImpl(
      {required this.x,
      required this.y,
      required this.width,
      required this.height,
      required this.isFullScreen});

  @override
  final int x;
  @override
  final int y;
  @override
  final int width;
  @override
  final int height;
  @override
  final bool isFullScreen;

  @override
  String toString() {
    return 'PositionEntity(x: $x, y: $y, width: $width, height: $height, isFullScreen: $isFullScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionEntityImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isFullScreen, isFullScreen) ||
                other.isFullScreen == isFullScreen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, x, y, width, height, isFullScreen);

  /// Create a copy of PositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      __$$PositionEntityImplCopyWithImpl<_$PositionEntityImpl>(
          this, _$identity);
}

abstract class _PositionEntity implements PositionEntity {
  const factory _PositionEntity(
      {required final int x,
      required final int y,
      required final int width,
      required final int height,
      required final bool isFullScreen}) = _$PositionEntityImpl;

  @override
  int get x;
  @override
  int get y;
  @override
  int get width;
  @override
  int get height;
  @override
  bool get isFullScreen;

  /// Create a copy of PositionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UsageEntity {
  int get memory => throw _privateConstructorUsedError;

  /// Create a copy of UsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageEntityCopyWith<UsageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageEntityCopyWith<$Res> {
  factory $UsageEntityCopyWith(
          UsageEntity value, $Res Function(UsageEntity) then) =
      _$UsageEntityCopyWithImpl<$Res, UsageEntity>;
  @useResult
  $Res call({int memory});
}

/// @nodoc
class _$UsageEntityCopyWithImpl<$Res, $Val extends UsageEntity>
    implements $UsageEntityCopyWith<$Res> {
  _$UsageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memory = null,
  }) {
    return _then(_value.copyWith(
      memory: null == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageEntityImplCopyWith<$Res>
    implements $UsageEntityCopyWith<$Res> {
  factory _$$UsageEntityImplCopyWith(
          _$UsageEntityImpl value, $Res Function(_$UsageEntityImpl) then) =
      __$$UsageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int memory});
}

/// @nodoc
class __$$UsageEntityImplCopyWithImpl<$Res>
    extends _$UsageEntityCopyWithImpl<$Res, _$UsageEntityImpl>
    implements _$$UsageEntityImplCopyWith<$Res> {
  __$$UsageEntityImplCopyWithImpl(
      _$UsageEntityImpl _value, $Res Function(_$UsageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memory = null,
  }) {
    return _then(_$UsageEntityImpl(
      memory: null == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UsageEntityImpl implements _UsageEntity {
  const _$UsageEntityImpl({required this.memory});

  @override
  final int memory;

  @override
  String toString() {
    return 'UsageEntity(memory: $memory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageEntityImpl &&
            (identical(other.memory, memory) || other.memory == memory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memory);

  /// Create a copy of UsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageEntityImplCopyWith<_$UsageEntityImpl> get copyWith =>
      __$$UsageEntityImplCopyWithImpl<_$UsageEntityImpl>(this, _$identity);
}

abstract class _UsageEntity implements UsageEntity {
  const factory _UsageEntity({required final int memory}) = _$UsageEntityImpl;

  @override
  int get memory;

  /// Create a copy of UsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageEntityImplCopyWith<_$UsageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WindowEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  PositionEntity get position => throw _privateConstructorUsedError;
  InfoEntity get info => throw _privateConstructorUsedError;
  UsageEntity get usage => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WindowEntityCopyWith<WindowEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindowEntityCopyWith<$Res> {
  factory $WindowEntityCopyWith(
          WindowEntity value, $Res Function(WindowEntity) then) =
      _$WindowEntityCopyWithImpl<$Res, WindowEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      PositionEntity position,
      InfoEntity info,
      UsageEntity usage,
      String url});

  $PositionEntityCopyWith<$Res> get position;
  $InfoEntityCopyWith<$Res> get info;
  $UsageEntityCopyWith<$Res> get usage;
}

/// @nodoc
class _$WindowEntityCopyWithImpl<$Res, $Val extends WindowEntity>
    implements $WindowEntityCopyWith<$Res> {
  _$WindowEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? position = null,
    Object? info = null,
    Object? usage = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoEntity,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as UsageEntity,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionEntityCopyWith<$Res> get position {
    return $PositionEntityCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoEntityCopyWith<$Res> get info {
    return $InfoEntityCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageEntityCopyWith<$Res> get usage {
    return $UsageEntityCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WindowEntityImplCopyWith<$Res>
    implements $WindowEntityCopyWith<$Res> {
  factory _$$WindowEntityImplCopyWith(
          _$WindowEntityImpl value, $Res Function(_$WindowEntityImpl) then) =
      __$$WindowEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      PositionEntity position,
      InfoEntity info,
      UsageEntity usage,
      String url});

  @override
  $PositionEntityCopyWith<$Res> get position;
  @override
  $InfoEntityCopyWith<$Res> get info;
  @override
  $UsageEntityCopyWith<$Res> get usage;
}

/// @nodoc
class __$$WindowEntityImplCopyWithImpl<$Res>
    extends _$WindowEntityCopyWithImpl<$Res, _$WindowEntityImpl>
    implements _$$WindowEntityImplCopyWith<$Res> {
  __$$WindowEntityImplCopyWithImpl(
      _$WindowEntityImpl _value, $Res Function(_$WindowEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? position = null,
    Object? info = null,
    Object? usage = null,
    Object? url = null,
  }) {
    return _then(_$WindowEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoEntity,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as UsageEntity,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WindowEntityImpl implements _WindowEntity {
  const _$WindowEntityImpl(
      {required this.id,
      required this.title,
      required this.position,
      required this.info,
      required this.usage,
      required this.url});

  @override
  final int id;
  @override
  final String title;
  @override
  final PositionEntity position;
  @override
  final InfoEntity info;
  @override
  final UsageEntity usage;
  @override
  final String url;

  @override
  String toString() {
    return 'WindowEntity(id: $id, title: $title, position: $position, info: $info, usage: $usage, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WindowEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, position, info, usage, url);

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WindowEntityImplCopyWith<_$WindowEntityImpl> get copyWith =>
      __$$WindowEntityImplCopyWithImpl<_$WindowEntityImpl>(this, _$identity);
}

abstract class _WindowEntity implements WindowEntity {
  const factory _WindowEntity(
      {required final int id,
      required final String title,
      required final PositionEntity position,
      required final InfoEntity info,
      required final UsageEntity usage,
      required final String url}) = _$WindowEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  PositionEntity get position;
  @override
  InfoEntity get info;
  @override
  UsageEntity get usage;
  @override
  String get url;

  /// Create a copy of WindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WindowEntityImplCopyWith<_$WindowEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WindowIconEntity {
  WindowEntity get window => throw _privateConstructorUsedError;
  IconEntity get icon => throw _privateConstructorUsedError;

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WindowIconEntityCopyWith<WindowIconEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindowIconEntityCopyWith<$Res> {
  factory $WindowIconEntityCopyWith(
          WindowIconEntity value, $Res Function(WindowIconEntity) then) =
      _$WindowIconEntityCopyWithImpl<$Res, WindowIconEntity>;
  @useResult
  $Res call({WindowEntity window, IconEntity icon});

  $WindowEntityCopyWith<$Res> get window;
  $IconEntityCopyWith<$Res> get icon;
}

/// @nodoc
class _$WindowIconEntityCopyWithImpl<$Res, $Val extends WindowIconEntity>
    implements $WindowIconEntityCopyWith<$Res> {
  _$WindowIconEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? window = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      window: null == window
          ? _value.window
          : window // ignore: cast_nullable_to_non_nullable
              as WindowEntity,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconEntity,
    ) as $Val);
  }

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WindowEntityCopyWith<$Res> get window {
    return $WindowEntityCopyWith<$Res>(_value.window, (value) {
      return _then(_value.copyWith(window: value) as $Val);
    });
  }

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IconEntityCopyWith<$Res> get icon {
    return $IconEntityCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WindowIconEntityImplCopyWith<$Res>
    implements $WindowIconEntityCopyWith<$Res> {
  factory _$$WindowIconEntityImplCopyWith(_$WindowIconEntityImpl value,
          $Res Function(_$WindowIconEntityImpl) then) =
      __$$WindowIconEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WindowEntity window, IconEntity icon});

  @override
  $WindowEntityCopyWith<$Res> get window;
  @override
  $IconEntityCopyWith<$Res> get icon;
}

/// @nodoc
class __$$WindowIconEntityImplCopyWithImpl<$Res>
    extends _$WindowIconEntityCopyWithImpl<$Res, _$WindowIconEntityImpl>
    implements _$$WindowIconEntityImplCopyWith<$Res> {
  __$$WindowIconEntityImplCopyWithImpl(_$WindowIconEntityImpl _value,
      $Res Function(_$WindowIconEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? window = null,
    Object? icon = null,
  }) {
    return _then(_$WindowIconEntityImpl(
      window: null == window
          ? _value.window
          : window // ignore: cast_nullable_to_non_nullable
              as WindowEntity,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconEntity,
    ));
  }
}

/// @nodoc

class _$WindowIconEntityImpl implements _WindowIconEntity {
  const _$WindowIconEntityImpl({required this.window, required this.icon});

  @override
  final WindowEntity window;
  @override
  final IconEntity icon;

  @override
  String toString() {
    return 'WindowIconEntity(window: $window, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WindowIconEntityImpl &&
            (identical(other.window, window) || other.window == window) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, window, icon);

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WindowIconEntityImplCopyWith<_$WindowIconEntityImpl> get copyWith =>
      __$$WindowIconEntityImplCopyWithImpl<_$WindowIconEntityImpl>(
          this, _$identity);
}

abstract class _WindowIconEntity implements WindowIconEntity {
  const factory _WindowIconEntity(
      {required final WindowEntity window,
      required final IconEntity icon}) = _$WindowIconEntityImpl;

  @override
  WindowEntity get window;
  @override
  IconEntity get icon;

  /// Create a copy of WindowIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WindowIconEntityImplCopyWith<_$WindowIconEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
