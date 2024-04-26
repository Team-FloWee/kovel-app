// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tourist_spot_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TouristSpotDetail _$TouristSpotDetailFromJson(Map<String, dynamic> json) {
  return _TouristSpotDetail.fromJson(json);
}

/// @nodoc
mixin _$TouristSpotDetail {
  String get expGuide => throw _privateConstructorUsedError;
  String get parking => throw _privateConstructorUsedError;
  String get restDay => throw _privateConstructorUsedError;
  String get useTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TouristSpotDetailCopyWith<TouristSpotDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TouristSpotDetailCopyWith<$Res> {
  factory $TouristSpotDetailCopyWith(
          TouristSpotDetail value, $Res Function(TouristSpotDetail) then) =
      _$TouristSpotDetailCopyWithImpl<$Res, TouristSpotDetail>;
  @useResult
  $Res call({String expGuide, String parking, String restDay, String useTime});
}

/// @nodoc
class _$TouristSpotDetailCopyWithImpl<$Res, $Val extends TouristSpotDetail>
    implements $TouristSpotDetailCopyWith<$Res> {
  _$TouristSpotDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expGuide = null,
    Object? parking = null,
    Object? restDay = null,
    Object? useTime = null,
  }) {
    return _then(_value.copyWith(
      expGuide: null == expGuide
          ? _value.expGuide
          : expGuide // ignore: cast_nullable_to_non_nullable
              as String,
      parking: null == parking
          ? _value.parking
          : parking // ignore: cast_nullable_to_non_nullable
              as String,
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
      useTime: null == useTime
          ? _value.useTime
          : useTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TouristSpotDetailImplCopyWith<$Res>
    implements $TouristSpotDetailCopyWith<$Res> {
  factory _$$TouristSpotDetailImplCopyWith(_$TouristSpotDetailImpl value,
          $Res Function(_$TouristSpotDetailImpl) then) =
      __$$TouristSpotDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String expGuide, String parking, String restDay, String useTime});
}

/// @nodoc
class __$$TouristSpotDetailImplCopyWithImpl<$Res>
    extends _$TouristSpotDetailCopyWithImpl<$Res, _$TouristSpotDetailImpl>
    implements _$$TouristSpotDetailImplCopyWith<$Res> {
  __$$TouristSpotDetailImplCopyWithImpl(_$TouristSpotDetailImpl _value,
      $Res Function(_$TouristSpotDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expGuide = null,
    Object? parking = null,
    Object? restDay = null,
    Object? useTime = null,
  }) {
    return _then(_$TouristSpotDetailImpl(
      expGuide: null == expGuide
          ? _value.expGuide
          : expGuide // ignore: cast_nullable_to_non_nullable
              as String,
      parking: null == parking
          ? _value.parking
          : parking // ignore: cast_nullable_to_non_nullable
              as String,
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
      useTime: null == useTime
          ? _value.useTime
          : useTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TouristSpotDetailImpl implements _TouristSpotDetail {
  const _$TouristSpotDetailImpl(
      {required this.expGuide,
      required this.parking,
      required this.restDay,
      required this.useTime});

  factory _$TouristSpotDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TouristSpotDetailImplFromJson(json);

  @override
  final String expGuide;
  @override
  final String parking;
  @override
  final String restDay;
  @override
  final String useTime;

  @override
  String toString() {
    return 'TouristSpotDetail(expGuide: $expGuide, parking: $parking, restDay: $restDay, useTime: $useTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TouristSpotDetailImpl &&
            (identical(other.expGuide, expGuide) ||
                other.expGuide == expGuide) &&
            (identical(other.parking, parking) || other.parking == parking) &&
            (identical(other.restDay, restDay) || other.restDay == restDay) &&
            (identical(other.useTime, useTime) || other.useTime == useTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, expGuide, parking, restDay, useTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TouristSpotDetailImplCopyWith<_$TouristSpotDetailImpl> get copyWith =>
      __$$TouristSpotDetailImplCopyWithImpl<_$TouristSpotDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TouristSpotDetailImplToJson(
      this,
    );
  }
}

abstract class _TouristSpotDetail implements TouristSpotDetail {
  const factory _TouristSpotDetail(
      {required final String expGuide,
      required final String parking,
      required final String restDay,
      required final String useTime}) = _$TouristSpotDetailImpl;

  factory _TouristSpotDetail.fromJson(Map<String, dynamic> json) =
      _$TouristSpotDetailImpl.fromJson;

  @override
  String get expGuide;
  @override
  String get parking;
  @override
  String get restDay;
  @override
  String get useTime;
  @override
  @JsonKey(ignore: true)
  _$$TouristSpotDetailImplCopyWith<_$TouristSpotDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
