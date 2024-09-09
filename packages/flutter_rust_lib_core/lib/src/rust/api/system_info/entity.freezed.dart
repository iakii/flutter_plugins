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
mixin _$CpuEntity {
  String get name => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  CpuUsageEntity get usage => throw _privateConstructorUsedError;

  /// Create a copy of CpuEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CpuEntityCopyWith<CpuEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CpuEntityCopyWith<$Res> {
  factory $CpuEntityCopyWith(CpuEntity value, $Res Function(CpuEntity) then) =
      _$CpuEntityCopyWithImpl<$Res, CpuEntity>;
  @useResult
  $Res call({String name, String vendorId, String brand, CpuUsageEntity usage});

  $CpuUsageEntityCopyWith<$Res> get usage;
}

/// @nodoc
class _$CpuEntityCopyWithImpl<$Res, $Val extends CpuEntity>
    implements $CpuEntityCopyWith<$Res> {
  _$CpuEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CpuEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? vendorId = null,
    Object? brand = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as CpuUsageEntity,
    ) as $Val);
  }

  /// Create a copy of CpuEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CpuUsageEntityCopyWith<$Res> get usage {
    return $CpuUsageEntityCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CpuEntityImplCopyWith<$Res>
    implements $CpuEntityCopyWith<$Res> {
  factory _$$CpuEntityImplCopyWith(
          _$CpuEntityImpl value, $Res Function(_$CpuEntityImpl) then) =
      __$$CpuEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String vendorId, String brand, CpuUsageEntity usage});

  @override
  $CpuUsageEntityCopyWith<$Res> get usage;
}

/// @nodoc
class __$$CpuEntityImplCopyWithImpl<$Res>
    extends _$CpuEntityCopyWithImpl<$Res, _$CpuEntityImpl>
    implements _$$CpuEntityImplCopyWith<$Res> {
  __$$CpuEntityImplCopyWithImpl(
      _$CpuEntityImpl _value, $Res Function(_$CpuEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CpuEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? vendorId = null,
    Object? brand = null,
    Object? usage = null,
  }) {
    return _then(_$CpuEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as CpuUsageEntity,
    ));
  }
}

/// @nodoc

class _$CpuEntityImpl implements _CpuEntity {
  const _$CpuEntityImpl(
      {required this.name,
      required this.vendorId,
      required this.brand,
      required this.usage});

  @override
  final String name;
  @override
  final String vendorId;
  @override
  final String brand;
  @override
  final CpuUsageEntity usage;

  @override
  String toString() {
    return 'CpuEntity(name: $name, vendorId: $vendorId, brand: $brand, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CpuEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, vendorId, brand, usage);

  /// Create a copy of CpuEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CpuEntityImplCopyWith<_$CpuEntityImpl> get copyWith =>
      __$$CpuEntityImplCopyWithImpl<_$CpuEntityImpl>(this, _$identity);
}

abstract class _CpuEntity implements CpuEntity {
  const factory _CpuEntity(
      {required final String name,
      required final String vendorId,
      required final String brand,
      required final CpuUsageEntity usage}) = _$CpuEntityImpl;

  @override
  String get name;
  @override
  String get vendorId;
  @override
  String get brand;
  @override
  CpuUsageEntity get usage;

  /// Create a copy of CpuEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CpuEntityImplCopyWith<_$CpuEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CpuUsageEntity {
  double get percent => throw _privateConstructorUsedError;
  BigInt get frequency => throw _privateConstructorUsedError;

  /// Create a copy of CpuUsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CpuUsageEntityCopyWith<CpuUsageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CpuUsageEntityCopyWith<$Res> {
  factory $CpuUsageEntityCopyWith(
          CpuUsageEntity value, $Res Function(CpuUsageEntity) then) =
      _$CpuUsageEntityCopyWithImpl<$Res, CpuUsageEntity>;
  @useResult
  $Res call({double percent, BigInt frequency});
}

/// @nodoc
class _$CpuUsageEntityCopyWithImpl<$Res, $Val extends CpuUsageEntity>
    implements $CpuUsageEntityCopyWith<$Res> {
  _$CpuUsageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CpuUsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = null,
    Object? frequency = null,
  }) {
    return _then(_value.copyWith(
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CpuUsageEntityImplCopyWith<$Res>
    implements $CpuUsageEntityCopyWith<$Res> {
  factory _$$CpuUsageEntityImplCopyWith(_$CpuUsageEntityImpl value,
          $Res Function(_$CpuUsageEntityImpl) then) =
      __$$CpuUsageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double percent, BigInt frequency});
}

/// @nodoc
class __$$CpuUsageEntityImplCopyWithImpl<$Res>
    extends _$CpuUsageEntityCopyWithImpl<$Res, _$CpuUsageEntityImpl>
    implements _$$CpuUsageEntityImplCopyWith<$Res> {
  __$$CpuUsageEntityImplCopyWithImpl(
      _$CpuUsageEntityImpl _value, $Res Function(_$CpuUsageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CpuUsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = null,
    Object? frequency = null,
  }) {
    return _then(_$CpuUsageEntityImpl(
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$CpuUsageEntityImpl implements _CpuUsageEntity {
  const _$CpuUsageEntityImpl({required this.percent, required this.frequency});

  @override
  final double percent;
  @override
  final BigInt frequency;

  @override
  String toString() {
    return 'CpuUsageEntity(percent: $percent, frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CpuUsageEntityImpl &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, percent, frequency);

  /// Create a copy of CpuUsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CpuUsageEntityImplCopyWith<_$CpuUsageEntityImpl> get copyWith =>
      __$$CpuUsageEntityImplCopyWithImpl<_$CpuUsageEntityImpl>(
          this, _$identity);
}

abstract class _CpuUsageEntity implements CpuUsageEntity {
  const factory _CpuUsageEntity(
      {required final double percent,
      required final BigInt frequency}) = _$CpuUsageEntityImpl;

  @override
  double get percent;
  @override
  BigInt get frequency;

  /// Create a copy of CpuUsageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CpuUsageEntityImplCopyWith<_$CpuUsageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IpNetworkEntity {
  IpNetworkType get ip => throw _privateConstructorUsedError;
  int get prefix => throw _privateConstructorUsedError;

  /// Create a copy of IpNetworkEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IpNetworkEntityCopyWith<IpNetworkEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpNetworkEntityCopyWith<$Res> {
  factory $IpNetworkEntityCopyWith(
          IpNetworkEntity value, $Res Function(IpNetworkEntity) then) =
      _$IpNetworkEntityCopyWithImpl<$Res, IpNetworkEntity>;
  @useResult
  $Res call({IpNetworkType ip, int prefix});
}

/// @nodoc
class _$IpNetworkEntityCopyWithImpl<$Res, $Val extends IpNetworkEntity>
    implements $IpNetworkEntityCopyWith<$Res> {
  _$IpNetworkEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IpNetworkEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? prefix = null,
  }) {
    return _then(_value.copyWith(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as IpNetworkType,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IpNetworkEntityImplCopyWith<$Res>
    implements $IpNetworkEntityCopyWith<$Res> {
  factory _$$IpNetworkEntityImplCopyWith(_$IpNetworkEntityImpl value,
          $Res Function(_$IpNetworkEntityImpl) then) =
      __$$IpNetworkEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IpNetworkType ip, int prefix});
}

/// @nodoc
class __$$IpNetworkEntityImplCopyWithImpl<$Res>
    extends _$IpNetworkEntityCopyWithImpl<$Res, _$IpNetworkEntityImpl>
    implements _$$IpNetworkEntityImplCopyWith<$Res> {
  __$$IpNetworkEntityImplCopyWithImpl(
      _$IpNetworkEntityImpl _value, $Res Function(_$IpNetworkEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of IpNetworkEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? prefix = null,
  }) {
    return _then(_$IpNetworkEntityImpl(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as IpNetworkType,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IpNetworkEntityImpl implements _IpNetworkEntity {
  const _$IpNetworkEntityImpl({required this.ip, required this.prefix});

  @override
  final IpNetworkType ip;
  @override
  final int prefix;

  @override
  String toString() {
    return 'IpNetworkEntity(ip: $ip, prefix: $prefix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpNetworkEntityImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.prefix, prefix) || other.prefix == prefix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ip, prefix);

  /// Create a copy of IpNetworkEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IpNetworkEntityImplCopyWith<_$IpNetworkEntityImpl> get copyWith =>
      __$$IpNetworkEntityImplCopyWithImpl<_$IpNetworkEntityImpl>(
          this, _$identity);
}

abstract class _IpNetworkEntity implements IpNetworkEntity {
  const factory _IpNetworkEntity(
      {required final IpNetworkType ip,
      required final int prefix}) = _$IpNetworkEntityImpl;

  @override
  IpNetworkType get ip;
  @override
  int get prefix;

  /// Create a copy of IpNetworkEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IpNetworkEntityImplCopyWith<_$IpNetworkEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetWorkEntity {
  String get name => throw _privateConstructorUsedError;
  BigInt get totalReceived => throw _privateConstructorUsedError;
  BigInt get received => throw _privateConstructorUsedError;
  BigInt get transmitted => throw _privateConstructorUsedError;
  BigInt get totalTransmitted => throw _privateConstructorUsedError;
  BigInt get packetsReceived => throw _privateConstructorUsedError;
  BigInt get totalPacketsReceived => throw _privateConstructorUsedError;
  BigInt get packetsTransmitted => throw _privateConstructorUsedError;
  BigInt get totalPacketsTransmitted => throw _privateConstructorUsedError;
  BigInt get errorsOnReceived => throw _privateConstructorUsedError;
  BigInt get totalErrorsOnReceived => throw _privateConstructorUsedError;
  BigInt get errorsOnTransmitted => throw _privateConstructorUsedError;
  BigInt get totalErrorsOnTransmitted => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  List<IpNetworkEntity> get ipNetworks => throw _privateConstructorUsedError;

  /// Create a copy of NetWorkEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetWorkEntityCopyWith<NetWorkEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetWorkEntityCopyWith<$Res> {
  factory $NetWorkEntityCopyWith(
          NetWorkEntity value, $Res Function(NetWorkEntity) then) =
      _$NetWorkEntityCopyWithImpl<$Res, NetWorkEntity>;
  @useResult
  $Res call(
      {String name,
      BigInt totalReceived,
      BigInt received,
      BigInt transmitted,
      BigInt totalTransmitted,
      BigInt packetsReceived,
      BigInt totalPacketsReceived,
      BigInt packetsTransmitted,
      BigInt totalPacketsTransmitted,
      BigInt errorsOnReceived,
      BigInt totalErrorsOnReceived,
      BigInt errorsOnTransmitted,
      BigInt totalErrorsOnTransmitted,
      String macAddress,
      List<IpNetworkEntity> ipNetworks});
}

/// @nodoc
class _$NetWorkEntityCopyWithImpl<$Res, $Val extends NetWorkEntity>
    implements $NetWorkEntityCopyWith<$Res> {
  _$NetWorkEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetWorkEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totalReceived = null,
    Object? received = null,
    Object? transmitted = null,
    Object? totalTransmitted = null,
    Object? packetsReceived = null,
    Object? totalPacketsReceived = null,
    Object? packetsTransmitted = null,
    Object? totalPacketsTransmitted = null,
    Object? errorsOnReceived = null,
    Object? totalErrorsOnReceived = null,
    Object? errorsOnTransmitted = null,
    Object? totalErrorsOnTransmitted = null,
    Object? macAddress = null,
    Object? ipNetworks = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalReceived: null == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as BigInt,
      transmitted: null == transmitted
          ? _value.transmitted
          : transmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalTransmitted: null == totalTransmitted
          ? _value.totalTransmitted
          : totalTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      packetsReceived: null == packetsReceived
          ? _value.packetsReceived
          : packetsReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalPacketsReceived: null == totalPacketsReceived
          ? _value.totalPacketsReceived
          : totalPacketsReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      packetsTransmitted: null == packetsTransmitted
          ? _value.packetsTransmitted
          : packetsTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalPacketsTransmitted: null == totalPacketsTransmitted
          ? _value.totalPacketsTransmitted
          : totalPacketsTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      errorsOnReceived: null == errorsOnReceived
          ? _value.errorsOnReceived
          : errorsOnReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalErrorsOnReceived: null == totalErrorsOnReceived
          ? _value.totalErrorsOnReceived
          : totalErrorsOnReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      errorsOnTransmitted: null == errorsOnTransmitted
          ? _value.errorsOnTransmitted
          : errorsOnTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalErrorsOnTransmitted: null == totalErrorsOnTransmitted
          ? _value.totalErrorsOnTransmitted
          : totalErrorsOnTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ipNetworks: null == ipNetworks
          ? _value.ipNetworks
          : ipNetworks // ignore: cast_nullable_to_non_nullable
              as List<IpNetworkEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetWorkEntityImplCopyWith<$Res>
    implements $NetWorkEntityCopyWith<$Res> {
  factory _$$NetWorkEntityImplCopyWith(
          _$NetWorkEntityImpl value, $Res Function(_$NetWorkEntityImpl) then) =
      __$$NetWorkEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      BigInt totalReceived,
      BigInt received,
      BigInt transmitted,
      BigInt totalTransmitted,
      BigInt packetsReceived,
      BigInt totalPacketsReceived,
      BigInt packetsTransmitted,
      BigInt totalPacketsTransmitted,
      BigInt errorsOnReceived,
      BigInt totalErrorsOnReceived,
      BigInt errorsOnTransmitted,
      BigInt totalErrorsOnTransmitted,
      String macAddress,
      List<IpNetworkEntity> ipNetworks});
}

/// @nodoc
class __$$NetWorkEntityImplCopyWithImpl<$Res>
    extends _$NetWorkEntityCopyWithImpl<$Res, _$NetWorkEntityImpl>
    implements _$$NetWorkEntityImplCopyWith<$Res> {
  __$$NetWorkEntityImplCopyWithImpl(
      _$NetWorkEntityImpl _value, $Res Function(_$NetWorkEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetWorkEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totalReceived = null,
    Object? received = null,
    Object? transmitted = null,
    Object? totalTransmitted = null,
    Object? packetsReceived = null,
    Object? totalPacketsReceived = null,
    Object? packetsTransmitted = null,
    Object? totalPacketsTransmitted = null,
    Object? errorsOnReceived = null,
    Object? totalErrorsOnReceived = null,
    Object? errorsOnTransmitted = null,
    Object? totalErrorsOnTransmitted = null,
    Object? macAddress = null,
    Object? ipNetworks = null,
  }) {
    return _then(_$NetWorkEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalReceived: null == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as BigInt,
      transmitted: null == transmitted
          ? _value.transmitted
          : transmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalTransmitted: null == totalTransmitted
          ? _value.totalTransmitted
          : totalTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      packetsReceived: null == packetsReceived
          ? _value.packetsReceived
          : packetsReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalPacketsReceived: null == totalPacketsReceived
          ? _value.totalPacketsReceived
          : totalPacketsReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      packetsTransmitted: null == packetsTransmitted
          ? _value.packetsTransmitted
          : packetsTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalPacketsTransmitted: null == totalPacketsTransmitted
          ? _value.totalPacketsTransmitted
          : totalPacketsTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      errorsOnReceived: null == errorsOnReceived
          ? _value.errorsOnReceived
          : errorsOnReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalErrorsOnReceived: null == totalErrorsOnReceived
          ? _value.totalErrorsOnReceived
          : totalErrorsOnReceived // ignore: cast_nullable_to_non_nullable
              as BigInt,
      errorsOnTransmitted: null == errorsOnTransmitted
          ? _value.errorsOnTransmitted
          : errorsOnTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      totalErrorsOnTransmitted: null == totalErrorsOnTransmitted
          ? _value.totalErrorsOnTransmitted
          : totalErrorsOnTransmitted // ignore: cast_nullable_to_non_nullable
              as BigInt,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ipNetworks: null == ipNetworks
          ? _value._ipNetworks
          : ipNetworks // ignore: cast_nullable_to_non_nullable
              as List<IpNetworkEntity>,
    ));
  }
}

/// @nodoc

class _$NetWorkEntityImpl implements _NetWorkEntity {
  const _$NetWorkEntityImpl(
      {required this.name,
      required this.totalReceived,
      required this.received,
      required this.transmitted,
      required this.totalTransmitted,
      required this.packetsReceived,
      required this.totalPacketsReceived,
      required this.packetsTransmitted,
      required this.totalPacketsTransmitted,
      required this.errorsOnReceived,
      required this.totalErrorsOnReceived,
      required this.errorsOnTransmitted,
      required this.totalErrorsOnTransmitted,
      required this.macAddress,
      required final List<IpNetworkEntity> ipNetworks})
      : _ipNetworks = ipNetworks;

  @override
  final String name;
  @override
  final BigInt totalReceived;
  @override
  final BigInt received;
  @override
  final BigInt transmitted;
  @override
  final BigInt totalTransmitted;
  @override
  final BigInt packetsReceived;
  @override
  final BigInt totalPacketsReceived;
  @override
  final BigInt packetsTransmitted;
  @override
  final BigInt totalPacketsTransmitted;
  @override
  final BigInt errorsOnReceived;
  @override
  final BigInt totalErrorsOnReceived;
  @override
  final BigInt errorsOnTransmitted;
  @override
  final BigInt totalErrorsOnTransmitted;
  @override
  final String macAddress;
  final List<IpNetworkEntity> _ipNetworks;
  @override
  List<IpNetworkEntity> get ipNetworks {
    if (_ipNetworks is EqualUnmodifiableListView) return _ipNetworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ipNetworks);
  }

  @override
  String toString() {
    return 'NetWorkEntity(name: $name, totalReceived: $totalReceived, received: $received, transmitted: $transmitted, totalTransmitted: $totalTransmitted, packetsReceived: $packetsReceived, totalPacketsReceived: $totalPacketsReceived, packetsTransmitted: $packetsTransmitted, totalPacketsTransmitted: $totalPacketsTransmitted, errorsOnReceived: $errorsOnReceived, totalErrorsOnReceived: $totalErrorsOnReceived, errorsOnTransmitted: $errorsOnTransmitted, totalErrorsOnTransmitted: $totalErrorsOnTransmitted, macAddress: $macAddress, ipNetworks: $ipNetworks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetWorkEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.transmitted, transmitted) ||
                other.transmitted == transmitted) &&
            (identical(other.totalTransmitted, totalTransmitted) ||
                other.totalTransmitted == totalTransmitted) &&
            (identical(other.packetsReceived, packetsReceived) ||
                other.packetsReceived == packetsReceived) &&
            (identical(other.totalPacketsReceived, totalPacketsReceived) ||
                other.totalPacketsReceived == totalPacketsReceived) &&
            (identical(other.packetsTransmitted, packetsTransmitted) ||
                other.packetsTransmitted == packetsTransmitted) &&
            (identical(
                    other.totalPacketsTransmitted, totalPacketsTransmitted) ||
                other.totalPacketsTransmitted == totalPacketsTransmitted) &&
            (identical(other.errorsOnReceived, errorsOnReceived) ||
                other.errorsOnReceived == errorsOnReceived) &&
            (identical(other.totalErrorsOnReceived, totalErrorsOnReceived) ||
                other.totalErrorsOnReceived == totalErrorsOnReceived) &&
            (identical(other.errorsOnTransmitted, errorsOnTransmitted) ||
                other.errorsOnTransmitted == errorsOnTransmitted) &&
            (identical(
                    other.totalErrorsOnTransmitted, totalErrorsOnTransmitted) ||
                other.totalErrorsOnTransmitted == totalErrorsOnTransmitted) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            const DeepCollectionEquality()
                .equals(other._ipNetworks, _ipNetworks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      totalReceived,
      received,
      transmitted,
      totalTransmitted,
      packetsReceived,
      totalPacketsReceived,
      packetsTransmitted,
      totalPacketsTransmitted,
      errorsOnReceived,
      totalErrorsOnReceived,
      errorsOnTransmitted,
      totalErrorsOnTransmitted,
      macAddress,
      const DeepCollectionEquality().hash(_ipNetworks));

  /// Create a copy of NetWorkEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetWorkEntityImplCopyWith<_$NetWorkEntityImpl> get copyWith =>
      __$$NetWorkEntityImplCopyWithImpl<_$NetWorkEntityImpl>(this, _$identity);
}

abstract class _NetWorkEntity implements NetWorkEntity {
  const factory _NetWorkEntity(
      {required final String name,
      required final BigInt totalReceived,
      required final BigInt received,
      required final BigInt transmitted,
      required final BigInt totalTransmitted,
      required final BigInt packetsReceived,
      required final BigInt totalPacketsReceived,
      required final BigInt packetsTransmitted,
      required final BigInt totalPacketsTransmitted,
      required final BigInt errorsOnReceived,
      required final BigInt totalErrorsOnReceived,
      required final BigInt errorsOnTransmitted,
      required final BigInt totalErrorsOnTransmitted,
      required final String macAddress,
      required final List<IpNetworkEntity> ipNetworks}) = _$NetWorkEntityImpl;

  @override
  String get name;
  @override
  BigInt get totalReceived;
  @override
  BigInt get received;
  @override
  BigInt get transmitted;
  @override
  BigInt get totalTransmitted;
  @override
  BigInt get packetsReceived;
  @override
  BigInt get totalPacketsReceived;
  @override
  BigInt get packetsTransmitted;
  @override
  BigInt get totalPacketsTransmitted;
  @override
  BigInt get errorsOnReceived;
  @override
  BigInt get totalErrorsOnReceived;
  @override
  BigInt get errorsOnTransmitted;
  @override
  BigInt get totalErrorsOnTransmitted;
  @override
  String get macAddress;
  @override
  List<IpNetworkEntity> get ipNetworks;

  /// Create a copy of NetWorkEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetWorkEntityImplCopyWith<_$NetWorkEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProcessEntity {
  String get name => throw _privateConstructorUsedError;
  List<String> get cmd => throw _privateConstructorUsedError;
  int get pid => throw _privateConstructorUsedError;
  int? get parent => throw _privateConstructorUsedError;
  List<String> get environ => throw _privateConstructorUsedError;
  String? get cwd => throw _privateConstructorUsedError;
  String? get root => throw _privateConstructorUsedError;
  BigInt get memory => throw _privateConstructorUsedError;
  BigInt get virtualMemory => throw _privateConstructorUsedError;
  BigInt get startTime => throw _privateConstructorUsedError;
  BigInt get runTime => throw _privateConstructorUsedError;
  double get cpuUsage => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get effectiveUserId => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  String? get effectiveGroupId => throw _privateConstructorUsedError;
  ProcessStatusEntity get processStatus => throw _privateConstructorUsedError;

  /// Create a copy of ProcessEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessEntityCopyWith<ProcessEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessEntityCopyWith<$Res> {
  factory $ProcessEntityCopyWith(
          ProcessEntity value, $Res Function(ProcessEntity) then) =
      _$ProcessEntityCopyWithImpl<$Res, ProcessEntity>;
  @useResult
  $Res call(
      {String name,
      List<String> cmd,
      int pid,
      int? parent,
      List<String> environ,
      String? cwd,
      String? root,
      BigInt memory,
      BigInt virtualMemory,
      BigInt startTime,
      BigInt runTime,
      double cpuUsage,
      String userId,
      String? effectiveUserId,
      String? groupId,
      String? effectiveGroupId,
      ProcessStatusEntity processStatus});

  $ProcessStatusEntityCopyWith<$Res> get processStatus;
}

/// @nodoc
class _$ProcessEntityCopyWithImpl<$Res, $Val extends ProcessEntity>
    implements $ProcessEntityCopyWith<$Res> {
  _$ProcessEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cmd = null,
    Object? pid = null,
    Object? parent = freezed,
    Object? environ = null,
    Object? cwd = freezed,
    Object? root = freezed,
    Object? memory = null,
    Object? virtualMemory = null,
    Object? startTime = null,
    Object? runTime = null,
    Object? cpuUsage = null,
    Object? userId = null,
    Object? effectiveUserId = freezed,
    Object? groupId = freezed,
    Object? effectiveGroupId = freezed,
    Object? processStatus = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      environ: null == environ
          ? _value.environ
          : environ // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cwd: freezed == cwd
          ? _value.cwd
          : cwd // ignore: cast_nullable_to_non_nullable
              as String?,
      root: freezed == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String?,
      memory: null == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as BigInt,
      virtualMemory: null == virtualMemory
          ? _value.virtualMemory
          : virtualMemory // ignore: cast_nullable_to_non_nullable
              as BigInt,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as BigInt,
      runTime: null == runTime
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as BigInt,
      cpuUsage: null == cpuUsage
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveUserId: freezed == effectiveUserId
          ? _value.effectiveUserId
          : effectiveUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveGroupId: freezed == effectiveGroupId
          ? _value.effectiveGroupId
          : effectiveGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      processStatus: null == processStatus
          ? _value.processStatus
          : processStatus // ignore: cast_nullable_to_non_nullable
              as ProcessStatusEntity,
    ) as $Val);
  }

  /// Create a copy of ProcessEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProcessStatusEntityCopyWith<$Res> get processStatus {
    return $ProcessStatusEntityCopyWith<$Res>(_value.processStatus, (value) {
      return _then(_value.copyWith(processStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProcessEntityImplCopyWith<$Res>
    implements $ProcessEntityCopyWith<$Res> {
  factory _$$ProcessEntityImplCopyWith(
          _$ProcessEntityImpl value, $Res Function(_$ProcessEntityImpl) then) =
      __$$ProcessEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<String> cmd,
      int pid,
      int? parent,
      List<String> environ,
      String? cwd,
      String? root,
      BigInt memory,
      BigInt virtualMemory,
      BigInt startTime,
      BigInt runTime,
      double cpuUsage,
      String userId,
      String? effectiveUserId,
      String? groupId,
      String? effectiveGroupId,
      ProcessStatusEntity processStatus});

  @override
  $ProcessStatusEntityCopyWith<$Res> get processStatus;
}

/// @nodoc
class __$$ProcessEntityImplCopyWithImpl<$Res>
    extends _$ProcessEntityCopyWithImpl<$Res, _$ProcessEntityImpl>
    implements _$$ProcessEntityImplCopyWith<$Res> {
  __$$ProcessEntityImplCopyWithImpl(
      _$ProcessEntityImpl _value, $Res Function(_$ProcessEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cmd = null,
    Object? pid = null,
    Object? parent = freezed,
    Object? environ = null,
    Object? cwd = freezed,
    Object? root = freezed,
    Object? memory = null,
    Object? virtualMemory = null,
    Object? startTime = null,
    Object? runTime = null,
    Object? cpuUsage = null,
    Object? userId = null,
    Object? effectiveUserId = freezed,
    Object? groupId = freezed,
    Object? effectiveGroupId = freezed,
    Object? processStatus = null,
  }) {
    return _then(_$ProcessEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cmd: null == cmd
          ? _value._cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      environ: null == environ
          ? _value._environ
          : environ // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cwd: freezed == cwd
          ? _value.cwd
          : cwd // ignore: cast_nullable_to_non_nullable
              as String?,
      root: freezed == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String?,
      memory: null == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as BigInt,
      virtualMemory: null == virtualMemory
          ? _value.virtualMemory
          : virtualMemory // ignore: cast_nullable_to_non_nullable
              as BigInt,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as BigInt,
      runTime: null == runTime
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as BigInt,
      cpuUsage: null == cpuUsage
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveUserId: freezed == effectiveUserId
          ? _value.effectiveUserId
          : effectiveUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveGroupId: freezed == effectiveGroupId
          ? _value.effectiveGroupId
          : effectiveGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      processStatus: null == processStatus
          ? _value.processStatus
          : processStatus // ignore: cast_nullable_to_non_nullable
              as ProcessStatusEntity,
    ));
  }
}

/// @nodoc

class _$ProcessEntityImpl implements _ProcessEntity {
  const _$ProcessEntityImpl(
      {required this.name,
      required final List<String> cmd,
      required this.pid,
      this.parent,
      required final List<String> environ,
      this.cwd,
      this.root,
      required this.memory,
      required this.virtualMemory,
      required this.startTime,
      required this.runTime,
      required this.cpuUsage,
      required this.userId,
      this.effectiveUserId,
      this.groupId,
      this.effectiveGroupId,
      required this.processStatus})
      : _cmd = cmd,
        _environ = environ;

  @override
  final String name;
  final List<String> _cmd;
  @override
  List<String> get cmd {
    if (_cmd is EqualUnmodifiableListView) return _cmd;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cmd);
  }

  @override
  final int pid;
  @override
  final int? parent;
  final List<String> _environ;
  @override
  List<String> get environ {
    if (_environ is EqualUnmodifiableListView) return _environ;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_environ);
  }

  @override
  final String? cwd;
  @override
  final String? root;
  @override
  final BigInt memory;
  @override
  final BigInt virtualMemory;
  @override
  final BigInt startTime;
  @override
  final BigInt runTime;
  @override
  final double cpuUsage;
  @override
  final String userId;
  @override
  final String? effectiveUserId;
  @override
  final String? groupId;
  @override
  final String? effectiveGroupId;
  @override
  final ProcessStatusEntity processStatus;

  @override
  String toString() {
    return 'ProcessEntity(name: $name, cmd: $cmd, pid: $pid, parent: $parent, environ: $environ, cwd: $cwd, root: $root, memory: $memory, virtualMemory: $virtualMemory, startTime: $startTime, runTime: $runTime, cpuUsage: $cpuUsage, userId: $userId, effectiveUserId: $effectiveUserId, groupId: $groupId, effectiveGroupId: $effectiveGroupId, processStatus: $processStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._cmd, _cmd) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality().equals(other._environ, _environ) &&
            (identical(other.cwd, cwd) || other.cwd == cwd) &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.memory, memory) || other.memory == memory) &&
            (identical(other.virtualMemory, virtualMemory) ||
                other.virtualMemory == virtualMemory) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.runTime, runTime) || other.runTime == runTime) &&
            (identical(other.cpuUsage, cpuUsage) ||
                other.cpuUsage == cpuUsage) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.effectiveUserId, effectiveUserId) ||
                other.effectiveUserId == effectiveUserId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.effectiveGroupId, effectiveGroupId) ||
                other.effectiveGroupId == effectiveGroupId) &&
            (identical(other.processStatus, processStatus) ||
                other.processStatus == processStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_cmd),
      pid,
      parent,
      const DeepCollectionEquality().hash(_environ),
      cwd,
      root,
      memory,
      virtualMemory,
      startTime,
      runTime,
      cpuUsage,
      userId,
      effectiveUserId,
      groupId,
      effectiveGroupId,
      processStatus);

  /// Create a copy of ProcessEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessEntityImplCopyWith<_$ProcessEntityImpl> get copyWith =>
      __$$ProcessEntityImplCopyWithImpl<_$ProcessEntityImpl>(this, _$identity);
}

abstract class _ProcessEntity implements ProcessEntity {
  const factory _ProcessEntity(
      {required final String name,
      required final List<String> cmd,
      required final int pid,
      final int? parent,
      required final List<String> environ,
      final String? cwd,
      final String? root,
      required final BigInt memory,
      required final BigInt virtualMemory,
      required final BigInt startTime,
      required final BigInt runTime,
      required final double cpuUsage,
      required final String userId,
      final String? effectiveUserId,
      final String? groupId,
      final String? effectiveGroupId,
      required final ProcessStatusEntity processStatus}) = _$ProcessEntityImpl;

  @override
  String get name;
  @override
  List<String> get cmd;
  @override
  int get pid;
  @override
  int? get parent;
  @override
  List<String> get environ;
  @override
  String? get cwd;
  @override
  String? get root;
  @override
  BigInt get memory;
  @override
  BigInt get virtualMemory;
  @override
  BigInt get startTime;
  @override
  BigInt get runTime;
  @override
  double get cpuUsage;
  @override
  String get userId;
  @override
  String? get effectiveUserId;
  @override
  String? get groupId;
  @override
  String? get effectiveGroupId;
  @override
  ProcessStatusEntity get processStatus;

  /// Create a copy of ProcessEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessEntityImplCopyWith<_$ProcessEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProcessStatusEntity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessStatusEntityCopyWith<$Res> {
  factory $ProcessStatusEntityCopyWith(
          ProcessStatusEntity value, $Res Function(ProcessStatusEntity) then) =
      _$ProcessStatusEntityCopyWithImpl<$Res, ProcessStatusEntity>;
}

/// @nodoc
class _$ProcessStatusEntityCopyWithImpl<$Res, $Val extends ProcessStatusEntity>
    implements $ProcessStatusEntityCopyWith<$Res> {
  _$ProcessStatusEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProcessStatusEntity_IdleImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_IdleImplCopyWith(
          _$ProcessStatusEntity_IdleImpl value,
          $Res Function(_$ProcessStatusEntity_IdleImpl) then) =
      __$$ProcessStatusEntity_IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_IdleImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_IdleImpl>
    implements _$$ProcessStatusEntity_IdleImplCopyWith<$Res> {
  __$$ProcessStatusEntity_IdleImplCopyWithImpl(
      _$ProcessStatusEntity_IdleImpl _value,
      $Res Function(_$ProcessStatusEntity_IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_IdleImpl extends ProcessStatusEntity_Idle {
  const _$ProcessStatusEntity_IdleImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Idle extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Idle() = _$ProcessStatusEntity_IdleImpl;
  const ProcessStatusEntity_Idle._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_RunImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_RunImplCopyWith(
          _$ProcessStatusEntity_RunImpl value,
          $Res Function(_$ProcessStatusEntity_RunImpl) then) =
      __$$ProcessStatusEntity_RunImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_RunImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_RunImpl>
    implements _$$ProcessStatusEntity_RunImplCopyWith<$Res> {
  __$$ProcessStatusEntity_RunImplCopyWithImpl(
      _$ProcessStatusEntity_RunImpl _value,
      $Res Function(_$ProcessStatusEntity_RunImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_RunImpl extends ProcessStatusEntity_Run {
  const _$ProcessStatusEntity_RunImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.run()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_RunImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return run();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return run?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (run != null) {
      return run();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return run(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return run?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (run != null) {
      return run(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Run extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Run() = _$ProcessStatusEntity_RunImpl;
  const ProcessStatusEntity_Run._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_SleepImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_SleepImplCopyWith(
          _$ProcessStatusEntity_SleepImpl value,
          $Res Function(_$ProcessStatusEntity_SleepImpl) then) =
      __$$ProcessStatusEntity_SleepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_SleepImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_SleepImpl>
    implements _$$ProcessStatusEntity_SleepImplCopyWith<$Res> {
  __$$ProcessStatusEntity_SleepImplCopyWithImpl(
      _$ProcessStatusEntity_SleepImpl _value,
      $Res Function(_$ProcessStatusEntity_SleepImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_SleepImpl extends ProcessStatusEntity_Sleep {
  const _$ProcessStatusEntity_SleepImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.sleep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_SleepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return sleep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return sleep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (sleep != null) {
      return sleep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return sleep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return sleep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (sleep != null) {
      return sleep(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Sleep extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Sleep() = _$ProcessStatusEntity_SleepImpl;
  const ProcessStatusEntity_Sleep._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_StopImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_StopImplCopyWith(
          _$ProcessStatusEntity_StopImpl value,
          $Res Function(_$ProcessStatusEntity_StopImpl) then) =
      __$$ProcessStatusEntity_StopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_StopImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_StopImpl>
    implements _$$ProcessStatusEntity_StopImplCopyWith<$Res> {
  __$$ProcessStatusEntity_StopImplCopyWithImpl(
      _$ProcessStatusEntity_StopImpl _value,
      $Res Function(_$ProcessStatusEntity_StopImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_StopImpl extends ProcessStatusEntity_Stop {
  const _$ProcessStatusEntity_StopImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_StopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Stop extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Stop() = _$ProcessStatusEntity_StopImpl;
  const ProcessStatusEntity_Stop._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_ZombieImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_ZombieImplCopyWith(
          _$ProcessStatusEntity_ZombieImpl value,
          $Res Function(_$ProcessStatusEntity_ZombieImpl) then) =
      __$$ProcessStatusEntity_ZombieImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_ZombieImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_ZombieImpl>
    implements _$$ProcessStatusEntity_ZombieImplCopyWith<$Res> {
  __$$ProcessStatusEntity_ZombieImplCopyWithImpl(
      _$ProcessStatusEntity_ZombieImpl _value,
      $Res Function(_$ProcessStatusEntity_ZombieImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_ZombieImpl extends ProcessStatusEntity_Zombie {
  const _$ProcessStatusEntity_ZombieImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.zombie()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_ZombieImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return zombie();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return zombie?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (zombie != null) {
      return zombie();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return zombie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return zombie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (zombie != null) {
      return zombie(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Zombie extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Zombie() = _$ProcessStatusEntity_ZombieImpl;
  const ProcessStatusEntity_Zombie._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_TracingImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_TracingImplCopyWith(
          _$ProcessStatusEntity_TracingImpl value,
          $Res Function(_$ProcessStatusEntity_TracingImpl) then) =
      __$$ProcessStatusEntity_TracingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_TracingImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_TracingImpl>
    implements _$$ProcessStatusEntity_TracingImplCopyWith<$Res> {
  __$$ProcessStatusEntity_TracingImplCopyWithImpl(
      _$ProcessStatusEntity_TracingImpl _value,
      $Res Function(_$ProcessStatusEntity_TracingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_TracingImpl extends ProcessStatusEntity_Tracing {
  const _$ProcessStatusEntity_TracingImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.tracing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_TracingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return tracing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return tracing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (tracing != null) {
      return tracing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return tracing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return tracing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (tracing != null) {
      return tracing(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Tracing extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Tracing() =
      _$ProcessStatusEntity_TracingImpl;
  const ProcessStatusEntity_Tracing._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_DeadImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_DeadImplCopyWith(
          _$ProcessStatusEntity_DeadImpl value,
          $Res Function(_$ProcessStatusEntity_DeadImpl) then) =
      __$$ProcessStatusEntity_DeadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_DeadImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_DeadImpl>
    implements _$$ProcessStatusEntity_DeadImplCopyWith<$Res> {
  __$$ProcessStatusEntity_DeadImplCopyWithImpl(
      _$ProcessStatusEntity_DeadImpl _value,
      $Res Function(_$ProcessStatusEntity_DeadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_DeadImpl extends ProcessStatusEntity_Dead {
  const _$ProcessStatusEntity_DeadImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.dead()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_DeadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return dead();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return dead?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (dead != null) {
      return dead();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return dead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return dead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (dead != null) {
      return dead(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Dead extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Dead() = _$ProcessStatusEntity_DeadImpl;
  const ProcessStatusEntity_Dead._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_WakeKillImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_WakeKillImplCopyWith(
          _$ProcessStatusEntity_WakeKillImpl value,
          $Res Function(_$ProcessStatusEntity_WakeKillImpl) then) =
      __$$ProcessStatusEntity_WakeKillImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_WakeKillImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_WakeKillImpl>
    implements _$$ProcessStatusEntity_WakeKillImplCopyWith<$Res> {
  __$$ProcessStatusEntity_WakeKillImplCopyWithImpl(
      _$ProcessStatusEntity_WakeKillImpl _value,
      $Res Function(_$ProcessStatusEntity_WakeKillImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_WakeKillImpl extends ProcessStatusEntity_WakeKill {
  const _$ProcessStatusEntity_WakeKillImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.wakeKill()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_WakeKillImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return wakeKill();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return wakeKill?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (wakeKill != null) {
      return wakeKill();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return wakeKill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return wakeKill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (wakeKill != null) {
      return wakeKill(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_WakeKill extends ProcessStatusEntity {
  const factory ProcessStatusEntity_WakeKill() =
      _$ProcessStatusEntity_WakeKillImpl;
  const ProcessStatusEntity_WakeKill._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_WakingImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_WakingImplCopyWith(
          _$ProcessStatusEntity_WakingImpl value,
          $Res Function(_$ProcessStatusEntity_WakingImpl) then) =
      __$$ProcessStatusEntity_WakingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_WakingImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_WakingImpl>
    implements _$$ProcessStatusEntity_WakingImplCopyWith<$Res> {
  __$$ProcessStatusEntity_WakingImplCopyWithImpl(
      _$ProcessStatusEntity_WakingImpl _value,
      $Res Function(_$ProcessStatusEntity_WakingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_WakingImpl extends ProcessStatusEntity_Waking {
  const _$ProcessStatusEntity_WakingImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.waking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_WakingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return waking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return waking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (waking != null) {
      return waking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return waking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return waking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (waking != null) {
      return waking(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Waking extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Waking() = _$ProcessStatusEntity_WakingImpl;
  const ProcessStatusEntity_Waking._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_ParkedImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_ParkedImplCopyWith(
          _$ProcessStatusEntity_ParkedImpl value,
          $Res Function(_$ProcessStatusEntity_ParkedImpl) then) =
      __$$ProcessStatusEntity_ParkedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_ParkedImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_ParkedImpl>
    implements _$$ProcessStatusEntity_ParkedImplCopyWith<$Res> {
  __$$ProcessStatusEntity_ParkedImplCopyWithImpl(
      _$ProcessStatusEntity_ParkedImpl _value,
      $Res Function(_$ProcessStatusEntity_ParkedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_ParkedImpl extends ProcessStatusEntity_Parked {
  const _$ProcessStatusEntity_ParkedImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.parked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_ParkedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return parked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return parked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (parked != null) {
      return parked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return parked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return parked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (parked != null) {
      return parked(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Parked extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Parked() = _$ProcessStatusEntity_ParkedImpl;
  const ProcessStatusEntity_Parked._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_LockBlockedImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_LockBlockedImplCopyWith(
          _$ProcessStatusEntity_LockBlockedImpl value,
          $Res Function(_$ProcessStatusEntity_LockBlockedImpl) then) =
      __$$ProcessStatusEntity_LockBlockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_LockBlockedImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_LockBlockedImpl>
    implements _$$ProcessStatusEntity_LockBlockedImplCopyWith<$Res> {
  __$$ProcessStatusEntity_LockBlockedImplCopyWithImpl(
      _$ProcessStatusEntity_LockBlockedImpl _value,
      $Res Function(_$ProcessStatusEntity_LockBlockedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_LockBlockedImpl
    extends ProcessStatusEntity_LockBlocked {
  const _$ProcessStatusEntity_LockBlockedImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.lockBlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_LockBlockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return lockBlocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return lockBlocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (lockBlocked != null) {
      return lockBlocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return lockBlocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return lockBlocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (lockBlocked != null) {
      return lockBlocked(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_LockBlocked extends ProcessStatusEntity {
  const factory ProcessStatusEntity_LockBlocked() =
      _$ProcessStatusEntity_LockBlockedImpl;
  const ProcessStatusEntity_LockBlocked._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_UninterruptibleDiskSleepImplCopyWith<
    $Res> {
  factory _$$ProcessStatusEntity_UninterruptibleDiskSleepImplCopyWith(
          _$ProcessStatusEntity_UninterruptibleDiskSleepImpl value,
          $Res Function(_$ProcessStatusEntity_UninterruptibleDiskSleepImpl)
              then) =
      __$$ProcessStatusEntity_UninterruptibleDiskSleepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessStatusEntity_UninterruptibleDiskSleepImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_UninterruptibleDiskSleepImpl>
    implements
        _$$ProcessStatusEntity_UninterruptibleDiskSleepImplCopyWith<$Res> {
  __$$ProcessStatusEntity_UninterruptibleDiskSleepImplCopyWithImpl(
      _$ProcessStatusEntity_UninterruptibleDiskSleepImpl _value,
      $Res Function(_$ProcessStatusEntity_UninterruptibleDiskSleepImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessStatusEntity_UninterruptibleDiskSleepImpl
    extends ProcessStatusEntity_UninterruptibleDiskSleep {
  const _$ProcessStatusEntity_UninterruptibleDiskSleepImpl() : super._();

  @override
  String toString() {
    return 'ProcessStatusEntity.uninterruptibleDiskSleep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_UninterruptibleDiskSleepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return uninterruptibleDiskSleep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return uninterruptibleDiskSleep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (uninterruptibleDiskSleep != null) {
      return uninterruptibleDiskSleep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return uninterruptibleDiskSleep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return uninterruptibleDiskSleep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (uninterruptibleDiskSleep != null) {
      return uninterruptibleDiskSleep(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_UninterruptibleDiskSleep
    extends ProcessStatusEntity {
  const factory ProcessStatusEntity_UninterruptibleDiskSleep() =
      _$ProcessStatusEntity_UninterruptibleDiskSleepImpl;
  const ProcessStatusEntity_UninterruptibleDiskSleep._() : super._();
}

/// @nodoc
abstract class _$$ProcessStatusEntity_UnknownImplCopyWith<$Res> {
  factory _$$ProcessStatusEntity_UnknownImplCopyWith(
          _$ProcessStatusEntity_UnknownImpl value,
          $Res Function(_$ProcessStatusEntity_UnknownImpl) then) =
      __$$ProcessStatusEntity_UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$ProcessStatusEntity_UnknownImplCopyWithImpl<$Res>
    extends _$ProcessStatusEntityCopyWithImpl<$Res,
        _$ProcessStatusEntity_UnknownImpl>
    implements _$$ProcessStatusEntity_UnknownImplCopyWith<$Res> {
  __$$ProcessStatusEntity_UnknownImplCopyWithImpl(
      _$ProcessStatusEntity_UnknownImpl _value,
      $Res Function(_$ProcessStatusEntity_UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ProcessStatusEntity_UnknownImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProcessStatusEntity_UnknownImpl extends ProcessStatusEntity_Unknown {
  const _$ProcessStatusEntity_UnknownImpl(this.field0) : super._();

  @override
  final int field0;

  @override
  String toString() {
    return 'ProcessStatusEntity.unknown(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStatusEntity_UnknownImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessStatusEntity_UnknownImplCopyWith<_$ProcessStatusEntity_UnknownImpl>
      get copyWith => __$$ProcessStatusEntity_UnknownImplCopyWithImpl<
          _$ProcessStatusEntity_UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() sleep,
    required TResult Function() stop,
    required TResult Function() zombie,
    required TResult Function() tracing,
    required TResult Function() dead,
    required TResult Function() wakeKill,
    required TResult Function() waking,
    required TResult Function() parked,
    required TResult Function() lockBlocked,
    required TResult Function() uninterruptibleDiskSleep,
    required TResult Function(int field0) unknown,
  }) {
    return unknown(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? run,
    TResult? Function()? sleep,
    TResult? Function()? stop,
    TResult? Function()? zombie,
    TResult? Function()? tracing,
    TResult? Function()? dead,
    TResult? Function()? wakeKill,
    TResult? Function()? waking,
    TResult? Function()? parked,
    TResult? Function()? lockBlocked,
    TResult? Function()? uninterruptibleDiskSleep,
    TResult? Function(int field0)? unknown,
  }) {
    return unknown?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? sleep,
    TResult Function()? stop,
    TResult Function()? zombie,
    TResult Function()? tracing,
    TResult Function()? dead,
    TResult Function()? wakeKill,
    TResult Function()? waking,
    TResult Function()? parked,
    TResult Function()? lockBlocked,
    TResult Function()? uninterruptibleDiskSleep,
    TResult Function(int field0)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProcessStatusEntity_Idle value) idle,
    required TResult Function(ProcessStatusEntity_Run value) run,
    required TResult Function(ProcessStatusEntity_Sleep value) sleep,
    required TResult Function(ProcessStatusEntity_Stop value) stop,
    required TResult Function(ProcessStatusEntity_Zombie value) zombie,
    required TResult Function(ProcessStatusEntity_Tracing value) tracing,
    required TResult Function(ProcessStatusEntity_Dead value) dead,
    required TResult Function(ProcessStatusEntity_WakeKill value) wakeKill,
    required TResult Function(ProcessStatusEntity_Waking value) waking,
    required TResult Function(ProcessStatusEntity_Parked value) parked,
    required TResult Function(ProcessStatusEntity_LockBlocked value)
        lockBlocked,
    required TResult Function(
            ProcessStatusEntity_UninterruptibleDiskSleep value)
        uninterruptibleDiskSleep,
    required TResult Function(ProcessStatusEntity_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProcessStatusEntity_Idle value)? idle,
    TResult? Function(ProcessStatusEntity_Run value)? run,
    TResult? Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult? Function(ProcessStatusEntity_Stop value)? stop,
    TResult? Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult? Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult? Function(ProcessStatusEntity_Dead value)? dead,
    TResult? Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult? Function(ProcessStatusEntity_Waking value)? waking,
    TResult? Function(ProcessStatusEntity_Parked value)? parked,
    TResult? Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult? Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult? Function(ProcessStatusEntity_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProcessStatusEntity_Idle value)? idle,
    TResult Function(ProcessStatusEntity_Run value)? run,
    TResult Function(ProcessStatusEntity_Sleep value)? sleep,
    TResult Function(ProcessStatusEntity_Stop value)? stop,
    TResult Function(ProcessStatusEntity_Zombie value)? zombie,
    TResult Function(ProcessStatusEntity_Tracing value)? tracing,
    TResult Function(ProcessStatusEntity_Dead value)? dead,
    TResult Function(ProcessStatusEntity_WakeKill value)? wakeKill,
    TResult Function(ProcessStatusEntity_Waking value)? waking,
    TResult Function(ProcessStatusEntity_Parked value)? parked,
    TResult Function(ProcessStatusEntity_LockBlocked value)? lockBlocked,
    TResult Function(ProcessStatusEntity_UninterruptibleDiskSleep value)?
        uninterruptibleDiskSleep,
    TResult Function(ProcessStatusEntity_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class ProcessStatusEntity_Unknown extends ProcessStatusEntity {
  const factory ProcessStatusEntity_Unknown(final int field0) =
      _$ProcessStatusEntity_UnknownImpl;
  const ProcessStatusEntity_Unknown._() : super._();

  int get field0;

  /// Create a copy of ProcessStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessStatusEntity_UnknownImplCopyWith<_$ProcessStatusEntity_UnknownImpl>
      get copyWith => throw _privateConstructorUsedError;
}
