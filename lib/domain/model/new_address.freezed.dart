// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewAddress _$NewAddressFromJson(Map<String, dynamic> json) {
  return _NewAddress.fromJson(json);
}

/// @nodoc
mixin _$NewAddress {
  String get addressName => throw _privateConstructorUsedError;
  String get region1depthName => throw _privateConstructorUsedError;
  String get region2depthName => throw _privateConstructorUsedError;
  String get region3depthName => throw _privateConstructorUsedError;
  String get roadName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewAddressCopyWith<NewAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAddressCopyWith<$Res> {
  factory $NewAddressCopyWith(
          NewAddress value, $Res Function(NewAddress) then) =
      _$NewAddressCopyWithImpl<$Res, NewAddress>;
  @useResult
  $Res call(
      {String addressName,
      String region1depthName,
      String region2depthName,
      String region3depthName,
      String roadName});
}

/// @nodoc
class _$NewAddressCopyWithImpl<$Res, $Val extends NewAddress>
    implements $NewAddressCopyWith<$Res> {
  _$NewAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = null,
    Object? region1depthName = null,
    Object? region2depthName = null,
    Object? region3depthName = null,
    Object? roadName = null,
  }) {
    return _then(_value.copyWith(
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      region1depthName: null == region1depthName
          ? _value.region1depthName
          : region1depthName // ignore: cast_nullable_to_non_nullable
              as String,
      region2depthName: null == region2depthName
          ? _value.region2depthName
          : region2depthName // ignore: cast_nullable_to_non_nullable
              as String,
      region3depthName: null == region3depthName
          ? _value.region3depthName
          : region3depthName // ignore: cast_nullable_to_non_nullable
              as String,
      roadName: null == roadName
          ? _value.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewAddressImplCopyWith<$Res>
    implements $NewAddressCopyWith<$Res> {
  factory _$$NewAddressImplCopyWith(
          _$NewAddressImpl value, $Res Function(_$NewAddressImpl) then) =
      __$$NewAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String addressName,
      String region1depthName,
      String region2depthName,
      String region3depthName,
      String roadName});
}

/// @nodoc
class __$$NewAddressImplCopyWithImpl<$Res>
    extends _$NewAddressCopyWithImpl<$Res, _$NewAddressImpl>
    implements _$$NewAddressImplCopyWith<$Res> {
  __$$NewAddressImplCopyWithImpl(
      _$NewAddressImpl _value, $Res Function(_$NewAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = null,
    Object? region1depthName = null,
    Object? region2depthName = null,
    Object? region3depthName = null,
    Object? roadName = null,
  }) {
    return _then(_$NewAddressImpl(
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      region1depthName: null == region1depthName
          ? _value.region1depthName
          : region1depthName // ignore: cast_nullable_to_non_nullable
              as String,
      region2depthName: null == region2depthName
          ? _value.region2depthName
          : region2depthName // ignore: cast_nullable_to_non_nullable
              as String,
      region3depthName: null == region3depthName
          ? _value.region3depthName
          : region3depthName // ignore: cast_nullable_to_non_nullable
              as String,
      roadName: null == roadName
          ? _value.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewAddressImpl implements _NewAddress {
  const _$NewAddressImpl(
      {required this.addressName,
      required this.region1depthName,
      required this.region2depthName,
      required this.region3depthName,
      required this.roadName});

  factory _$NewAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewAddressImplFromJson(json);

  @override
  final String addressName;
  @override
  final String region1depthName;
  @override
  final String region2depthName;
  @override
  final String region3depthName;
  @override
  final String roadName;

  @override
  String toString() {
    return 'NewAddress(addressName: $addressName, region1depthName: $region1depthName, region2depthName: $region2depthName, region3depthName: $region3depthName, roadName: $roadName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewAddressImpl &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.region1depthName, region1depthName) ||
                other.region1depthName == region1depthName) &&
            (identical(other.region2depthName, region2depthName) ||
                other.region2depthName == region2depthName) &&
            (identical(other.region3depthName, region3depthName) ||
                other.region3depthName == region3depthName) &&
            (identical(other.roadName, roadName) ||
                other.roadName == roadName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addressName, region1depthName,
      region2depthName, region3depthName, roadName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewAddressImplCopyWith<_$NewAddressImpl> get copyWith =>
      __$$NewAddressImplCopyWithImpl<_$NewAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewAddressImplToJson(
      this,
    );
  }
}

abstract class _NewAddress implements NewAddress {
  const factory _NewAddress(
      {required final String addressName,
      required final String region1depthName,
      required final String region2depthName,
      required final String region3depthName,
      required final String roadName}) = _$NewAddressImpl;

  factory _NewAddress.fromJson(Map<String, dynamic> json) =
      _$NewAddressImpl.fromJson;

  @override
  String get addressName;
  @override
  String get region1depthName;
  @override
  String get region2depthName;
  @override
  String get region3depthName;
  @override
  String get roadName;
  @override
  @JsonKey(ignore: true)
  _$$NewAddressImplCopyWith<_$NewAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
