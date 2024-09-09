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
mixin _$ClipImage {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  Uint8List get bytes => throw _privateConstructorUsedError;

  /// Create a copy of ClipImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClipImageCopyWith<ClipImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipImageCopyWith<$Res> {
  factory $ClipImageCopyWith(ClipImage value, $Res Function(ClipImage) then) =
      _$ClipImageCopyWithImpl<$Res, ClipImage>;
  @useResult
  $Res call({int width, int height, Uint8List bytes});
}

/// @nodoc
class _$ClipImageCopyWithImpl<$Res, $Val extends ClipImage>
    implements $ClipImageCopyWith<$Res> {
  _$ClipImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClipImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? bytes = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipImageImplCopyWith<$Res>
    implements $ClipImageCopyWith<$Res> {
  factory _$$ClipImageImplCopyWith(
          _$ClipImageImpl value, $Res Function(_$ClipImageImpl) then) =
      __$$ClipImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int width, int height, Uint8List bytes});
}

/// @nodoc
class __$$ClipImageImplCopyWithImpl<$Res>
    extends _$ClipImageCopyWithImpl<$Res, _$ClipImageImpl>
    implements _$$ClipImageImplCopyWith<$Res> {
  __$$ClipImageImplCopyWithImpl(
      _$ClipImageImpl _value, $Res Function(_$ClipImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClipImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? bytes = null,
  }) {
    return _then(_$ClipImageImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$ClipImageImpl implements _ClipImage {
  const _$ClipImageImpl(
      {required this.width, required this.height, required this.bytes});

  @override
  final int width;
  @override
  final int height;
  @override
  final Uint8List bytes;

  @override
  String toString() {
    return 'ClipImage(width: $width, height: $height, bytes: $bytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipImageImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(other.bytes, bytes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, width, height, const DeepCollectionEquality().hash(bytes));

  /// Create a copy of ClipImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipImageImplCopyWith<_$ClipImageImpl> get copyWith =>
      __$$ClipImageImplCopyWithImpl<_$ClipImageImpl>(this, _$identity);
}

abstract class _ClipImage implements ClipImage {
  const factory _ClipImage(
      {required final int width,
      required final int height,
      required final Uint8List bytes}) = _$ClipImageImpl;

  @override
  int get width;
  @override
  int get height;
  @override
  Uint8List get bytes;

  /// Create a copy of ClipImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClipImageImplCopyWith<_$ClipImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClipboardData {
  DataType get dataType => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  ClipImage? get image => throw _privateConstructorUsedError;
  List<String>? get paths => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get appName => throw _privateConstructorUsedError;

  /// Create a copy of ClipboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClipboardDataCopyWith<ClipboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipboardDataCopyWith<$Res> {
  factory $ClipboardDataCopyWith(
          ClipboardData value, $Res Function(ClipboardData) then) =
      _$ClipboardDataCopyWithImpl<$Res, ClipboardData>;
  @useResult
  $Res call(
      {DataType dataType,
      String? content,
      ClipImage? image,
      List<String>? paths,
      String? icon,
      String? appName});

  $ClipImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$ClipboardDataCopyWithImpl<$Res, $Val extends ClipboardData>
    implements $ClipboardDataCopyWith<$Res> {
  _$ClipboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClipboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataType = null,
    Object? content = freezed,
    Object? image = freezed,
    Object? paths = freezed,
    Object? icon = freezed,
    Object? appName = freezed,
  }) {
    return _then(_value.copyWith(
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataType,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ClipImage?,
      paths: freezed == paths
          ? _value.paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ClipboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClipImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ClipImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClipboardDataImplCopyWith<$Res>
    implements $ClipboardDataCopyWith<$Res> {
  factory _$$ClipboardDataImplCopyWith(
          _$ClipboardDataImpl value, $Res Function(_$ClipboardDataImpl) then) =
      __$$ClipboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataType dataType,
      String? content,
      ClipImage? image,
      List<String>? paths,
      String? icon,
      String? appName});

  @override
  $ClipImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$ClipboardDataImplCopyWithImpl<$Res>
    extends _$ClipboardDataCopyWithImpl<$Res, _$ClipboardDataImpl>
    implements _$$ClipboardDataImplCopyWith<$Res> {
  __$$ClipboardDataImplCopyWithImpl(
      _$ClipboardDataImpl _value, $Res Function(_$ClipboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClipboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataType = null,
    Object? content = freezed,
    Object? image = freezed,
    Object? paths = freezed,
    Object? icon = freezed,
    Object? appName = freezed,
  }) {
    return _then(_$ClipboardDataImpl(
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataType,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ClipImage?,
      paths: freezed == paths
          ? _value._paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClipboardDataImpl implements _ClipboardData {
  const _$ClipboardDataImpl(
      {required this.dataType,
      this.content,
      this.image,
      final List<String>? paths,
      this.icon,
      this.appName})
      : _paths = paths;

  @override
  final DataType dataType;
  @override
  final String? content;
  @override
  final ClipImage? image;
  final List<String>? _paths;
  @override
  List<String>? get paths {
    final value = _paths;
    if (value == null) return null;
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? icon;
  @override
  final String? appName;

  @override
  String toString() {
    return 'ClipboardData(dataType: $dataType, content: $content, image: $image, paths: $paths, icon: $icon, appName: $appName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipboardDataImpl &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._paths, _paths) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.appName, appName) || other.appName == appName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataType, content, image,
      const DeepCollectionEquality().hash(_paths), icon, appName);

  /// Create a copy of ClipboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipboardDataImplCopyWith<_$ClipboardDataImpl> get copyWith =>
      __$$ClipboardDataImplCopyWithImpl<_$ClipboardDataImpl>(this, _$identity);
}

abstract class _ClipboardData implements ClipboardData {
  const factory _ClipboardData(
      {required final DataType dataType,
      final String? content,
      final ClipImage? image,
      final List<String>? paths,
      final String? icon,
      final String? appName}) = _$ClipboardDataImpl;

  @override
  DataType get dataType;
  @override
  String? get content;
  @override
  ClipImage? get image;
  @override
  List<String>? get paths;
  @override
  String? get icon;
  @override
  String? get appName;

  /// Create a copy of ClipboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClipboardDataImplCopyWith<_$ClipboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
