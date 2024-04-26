// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantDetail _$RestaurantDetailFromJson(Map<String, dynamic> json) {
  return _RestaurantDetail.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetail {
  TourDetail get tourDetail => throw _privateConstructorUsedError;
  String get firstMenu => throw _privateConstructorUsedError;
  String get treatMenu => throw _privateConstructorUsedError;
  String get parking => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;
  String get restDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantDetailCopyWith<RestaurantDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailCopyWith<$Res> {
  factory $RestaurantDetailCopyWith(
          RestaurantDetail value, $Res Function(RestaurantDetail) then) =
      _$RestaurantDetailCopyWithImpl<$Res, RestaurantDetail>;
  @useResult
  $Res call(
      {TourDetail tourDetail,
      String firstMenu,
      String treatMenu,
      String parking,
      String openTime,
      String restDay});

  $TourDetailCopyWith<$Res> get tourDetail;
}

/// @nodoc
class _$RestaurantDetailCopyWithImpl<$Res, $Val extends RestaurantDetail>
    implements $RestaurantDetailCopyWith<$Res> {
  _$RestaurantDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tourDetail = null,
    Object? firstMenu = null,
    Object? treatMenu = null,
    Object? parking = null,
    Object? openTime = null,
    Object? restDay = null,
  }) {
    return _then(_value.copyWith(
      tourDetail: null == tourDetail
          ? _value.tourDetail
          : tourDetail // ignore: cast_nullable_to_non_nullable
              as TourDetail,
      firstMenu: null == firstMenu
          ? _value.firstMenu
          : firstMenu // ignore: cast_nullable_to_non_nullable
              as String,
      treatMenu: null == treatMenu
          ? _value.treatMenu
          : treatMenu // ignore: cast_nullable_to_non_nullable
              as String,
      parking: null == parking
          ? _value.parking
          : parking // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourDetailCopyWith<$Res> get tourDetail {
    return $TourDetailCopyWith<$Res>(_value.tourDetail, (value) {
      return _then(_value.copyWith(tourDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantDetailImplCopyWith<$Res>
    implements $RestaurantDetailCopyWith<$Res> {
  factory _$$RestaurantDetailImplCopyWith(_$RestaurantDetailImpl value,
          $Res Function(_$RestaurantDetailImpl) then) =
      __$$RestaurantDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TourDetail tourDetail,
      String firstMenu,
      String treatMenu,
      String parking,
      String openTime,
      String restDay});

  @override
  $TourDetailCopyWith<$Res> get tourDetail;
}

/// @nodoc
class __$$RestaurantDetailImplCopyWithImpl<$Res>
    extends _$RestaurantDetailCopyWithImpl<$Res, _$RestaurantDetailImpl>
    implements _$$RestaurantDetailImplCopyWith<$Res> {
  __$$RestaurantDetailImplCopyWithImpl(_$RestaurantDetailImpl _value,
      $Res Function(_$RestaurantDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tourDetail = null,
    Object? firstMenu = null,
    Object? treatMenu = null,
    Object? parking = null,
    Object? openTime = null,
    Object? restDay = null,
  }) {
    return _then(_$RestaurantDetailImpl(
      tourDetail: null == tourDetail
          ? _value.tourDetail
          : tourDetail // ignore: cast_nullable_to_non_nullable
              as TourDetail,
      firstMenu: null == firstMenu
          ? _value.firstMenu
          : firstMenu // ignore: cast_nullable_to_non_nullable
              as String,
      treatMenu: null == treatMenu
          ? _value.treatMenu
          : treatMenu // ignore: cast_nullable_to_non_nullable
              as String,
      parking: null == parking
          ? _value.parking
          : parking // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDetailImpl implements _RestaurantDetail {
  const _$RestaurantDetailImpl(
      {required this.tourDetail,
      required this.firstMenu,
      required this.treatMenu,
      required this.parking,
      required this.openTime,
      required this.restDay});

  factory _$RestaurantDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDetailImplFromJson(json);

  @override
  final TourDetail tourDetail;
  @override
  final String firstMenu;
  @override
  final String treatMenu;
  @override
  final String parking;
  @override
  final String openTime;
  @override
  final String restDay;

  @override
  String toString() {
    return 'RestaurantDetail(tourDetail: $tourDetail, firstMenu: $firstMenu, treatMenu: $treatMenu, parking: $parking, openTime: $openTime, restDay: $restDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDetailImpl &&
            (identical(other.tourDetail, tourDetail) ||
                other.tourDetail == tourDetail) &&
            (identical(other.firstMenu, firstMenu) ||
                other.firstMenu == firstMenu) &&
            (identical(other.treatMenu, treatMenu) ||
                other.treatMenu == treatMenu) &&
            (identical(other.parking, parking) || other.parking == parking) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.restDay, restDay) || other.restDay == restDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tourDetail, firstMenu, treatMenu,
      parking, openTime, restDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDetailImplCopyWith<_$RestaurantDetailImpl> get copyWith =>
      __$$RestaurantDetailImplCopyWithImpl<_$RestaurantDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDetailImplToJson(
      this,
    );
  }
}

abstract class _RestaurantDetail implements RestaurantDetail {
  const factory _RestaurantDetail(
      {required final TourDetail tourDetail,
      required final String firstMenu,
      required final String treatMenu,
      required final String parking,
      required final String openTime,
      required final String restDay}) = _$RestaurantDetailImpl;

  factory _RestaurantDetail.fromJson(Map<String, dynamic> json) =
      _$RestaurantDetailImpl.fromJson;

  @override
  TourDetail get tourDetail;
  @override
  String get firstMenu;
  @override
  String get treatMenu;
  @override
  String get parking;
  @override
  String get openTime;
  @override
  String get restDay;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantDetailImplCopyWith<_$RestaurantDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
