// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leports_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeportsDetail _$LeportsDetailFromJson(Map<String, dynamic> json) {
  return _LeportsDetail.fromJson(json);
}

/// @nodoc
mixin _$LeportsDetail {
  String get restDay => throw _privateConstructorUsedError;
  String get useTime => throw _privateConstructorUsedError;
  String get ageLimit => throw _privateConstructorUsedError;
  String get parking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeportsDetailCopyWith<LeportsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeportsDetailCopyWith<$Res> {
  factory $LeportsDetailCopyWith(
          LeportsDetail value, $Res Function(LeportsDetail) then) =
      _$LeportsDetailCopyWithImpl<$Res, LeportsDetail>;
  @useResult
  $Res call({String restDay, String useTime, String ageLimit, String parking});
}

/// @nodoc
class _$LeportsDetailCopyWithImpl<$Res, $Val extends LeportsDetail>
    implements $LeportsDetailCopyWith<$Res> {
  _$LeportsDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restDay = null,
    Object? useTime = null,
    Object? ageLimit = null,
    Object? parking = null,
  }) {
    return _then(_value.copyWith(
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
      useTime: null == useTime
          ? _value.useTime
          : useTime // ignore: cast_nullable_to_non_nullable
              as String,
      ageLimit: null == ageLimit
          ? _value.ageLimit
          : ageLimit // ignore: cast_nullable_to_non_nullable
              as String,
      parking: null == parking
          ? _value.parking
          : parking // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeportsDetailImplCopyWith<$Res>
    implements $LeportsDetailCopyWith<$Res> {
  factory _$$LeportsDetailImplCopyWith(
          _$LeportsDetailImpl value, $Res Function(_$LeportsDetailImpl) then) =
      __$$LeportsDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String restDay, String useTime, String ageLimit, String parking});
}

/// @nodoc
class __$$LeportsDetailImplCopyWithImpl<$Res>
    extends _$LeportsDetailCopyWithImpl<$Res, _$LeportsDetailImpl>
    implements _$$LeportsDetailImplCopyWith<$Res> {
  __$$LeportsDetailImplCopyWithImpl(
      _$LeportsDetailImpl _value, $Res Function(_$LeportsDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restDay = null,
    Object? useTime = null,
    Object? ageLimit = null,
    Object? parking = null,
  }) {
    return _then(_$LeportsDetailImpl(
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
      useTime: null == useTime
          ? _value.useTime
          : useTime // ignore: cast_nullable_to_non_nullable
              as String,
      ageLimit: null == ageLimit
          ? _value.ageLimit
          : ageLimit // ignore: cast_nullable_to_non_nullable
              as String,
      parking: null == parking
          ? _value.parking
          : parking // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeportsDetailImpl implements _LeportsDetail {
  const _$LeportsDetailImpl(
      {required this.restDay,
      required this.useTime,
      required this.ageLimit,
      required this.parking});

  factory _$LeportsDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeportsDetailImplFromJson(json);

  @override
  final String restDay;
  @override
  final String useTime;
  @override
  final String ageLimit;
  @override
  final String parking;

  @override
  String toString() {
    return 'LeportsDetail(restDay: $restDay, useTime: $useTime, ageLimit: $ageLimit, parking: $parking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeportsDetailImpl &&
            (identical(other.restDay, restDay) || other.restDay == restDay) &&
            (identical(other.useTime, useTime) || other.useTime == useTime) &&
            (identical(other.ageLimit, ageLimit) ||
                other.ageLimit == ageLimit) &&
            (identical(other.parking, parking) || other.parking == parking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, restDay, useTime, ageLimit, parking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeportsDetailImplCopyWith<_$LeportsDetailImpl> get copyWith =>
      __$$LeportsDetailImplCopyWithImpl<_$LeportsDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeportsDetailImplToJson(
      this,
    );
  }
}

abstract class _LeportsDetail implements LeportsDetail {
  const factory _LeportsDetail(
      {required final String restDay,
      required final String useTime,
      required final String ageLimit,
      required final String parking}) = _$LeportsDetailImpl;

  factory _LeportsDetail.fromJson(Map<String, dynamic> json) =
      _$LeportsDetailImpl.fromJson;

  @override
  String get restDay;
  @override
  String get useTime;
  @override
  String get ageLimit;
  @override
  String get parking;
  @override
  @JsonKey(ignore: true)
  _$$LeportsDetailImplCopyWith<_$LeportsDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
