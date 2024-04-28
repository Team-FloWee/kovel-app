// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingDetail _$ShoppingDetailFromJson(Map<String, dynamic> json) {
  return _ShoppingDetail.fromJson(json);
}

/// @nodoc
mixin _$ShoppingDetail {
  int get contentId => throw _privateConstructorUsedError;
  int get contentTypeId => throw _privateConstructorUsedError;
  String get saleItem => throw _privateConstructorUsedError;
  String get saleItemCost => throw _privateConstructorUsedError;
  String get restDay => throw _privateConstructorUsedError;
  String get scale => throw _privateConstructorUsedError;
  String get creditCard => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingDetailCopyWith<ShoppingDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingDetailCopyWith<$Res> {
  factory $ShoppingDetailCopyWith(
          ShoppingDetail value, $Res Function(ShoppingDetail) then) =
      _$ShoppingDetailCopyWithImpl<$Res, ShoppingDetail>;
  @useResult
  $Res call(
      {int contentId,
      int contentTypeId,
      String saleItem,
      String saleItemCost,
      String restDay,
      String scale,
      String creditCard,
      String openTime});
}

/// @nodoc
class _$ShoppingDetailCopyWithImpl<$Res, $Val extends ShoppingDetail>
    implements $ShoppingDetailCopyWith<$Res> {
  _$ShoppingDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? saleItem = null,
    Object? saleItemCost = null,
    Object? restDay = null,
    Object? scale = null,
    Object? creditCard = null,
    Object? openTime = null,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      saleItem: null == saleItem
          ? _value.saleItem
          : saleItem // ignore: cast_nullable_to_non_nullable
              as String,
      saleItemCost: null == saleItemCost
          ? _value.saleItemCost
          : saleItemCost // ignore: cast_nullable_to_non_nullable
              as String,
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String,
      creditCard: null == creditCard
          ? _value.creditCard
          : creditCard // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingDetailImplCopyWith<$Res>
    implements $ShoppingDetailCopyWith<$Res> {
  factory _$$ShoppingDetailImplCopyWith(_$ShoppingDetailImpl value,
          $Res Function(_$ShoppingDetailImpl) then) =
      __$$ShoppingDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId,
      int contentTypeId,
      String saleItem,
      String saleItemCost,
      String restDay,
      String scale,
      String creditCard,
      String openTime});
}

/// @nodoc
class __$$ShoppingDetailImplCopyWithImpl<$Res>
    extends _$ShoppingDetailCopyWithImpl<$Res, _$ShoppingDetailImpl>
    implements _$$ShoppingDetailImplCopyWith<$Res> {
  __$$ShoppingDetailImplCopyWithImpl(
      _$ShoppingDetailImpl _value, $Res Function(_$ShoppingDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? saleItem = null,
    Object? saleItemCost = null,
    Object? restDay = null,
    Object? scale = null,
    Object? creditCard = null,
    Object? openTime = null,
  }) {
    return _then(_$ShoppingDetailImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      saleItem: null == saleItem
          ? _value.saleItem
          : saleItem // ignore: cast_nullable_to_non_nullable
              as String,
      saleItemCost: null == saleItemCost
          ? _value.saleItemCost
          : saleItemCost // ignore: cast_nullable_to_non_nullable
              as String,
      restDay: null == restDay
          ? _value.restDay
          : restDay // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String,
      creditCard: null == creditCard
          ? _value.creditCard
          : creditCard // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingDetailImpl implements _ShoppingDetail {
  const _$ShoppingDetailImpl(
      {required this.contentId,
      required this.contentTypeId,
      required this.saleItem,
      required this.saleItemCost,
      required this.restDay,
      required this.scale,
      required this.creditCard,
      required this.openTime});

  factory _$ShoppingDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingDetailImplFromJson(json);

  @override
  final int contentId;
  @override
  final int contentTypeId;
  @override
  final String saleItem;
  @override
  final String saleItemCost;
  @override
  final String restDay;
  @override
  final String scale;
  @override
  final String creditCard;
  @override
  final String openTime;

  @override
  String toString() {
    return 'ShoppingDetail(contentId: $contentId, contentTypeId: $contentTypeId, saleItem: $saleItem, saleItemCost: $saleItemCost, restDay: $restDay, scale: $scale, creditCard: $creditCard, openTime: $openTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingDetailImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.saleItem, saleItem) ||
                other.saleItem == saleItem) &&
            (identical(other.saleItemCost, saleItemCost) ||
                other.saleItemCost == saleItemCost) &&
            (identical(other.restDay, restDay) || other.restDay == restDay) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.creditCard, creditCard) ||
                other.creditCard == creditCard) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentId, contentTypeId,
      saleItem, saleItemCost, restDay, scale, creditCard, openTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingDetailImplCopyWith<_$ShoppingDetailImpl> get copyWith =>
      __$$ShoppingDetailImplCopyWithImpl<_$ShoppingDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingDetailImplToJson(
      this,
    );
  }
}

abstract class _ShoppingDetail implements ShoppingDetail {
  const factory _ShoppingDetail(
      {required final int contentId,
      required final int contentTypeId,
      required final String saleItem,
      required final String saleItemCost,
      required final String restDay,
      required final String scale,
      required final String creditCard,
      required final String openTime}) = _$ShoppingDetailImpl;

  factory _ShoppingDetail.fromJson(Map<String, dynamic> json) =
      _$ShoppingDetailImpl.fromJson;

  @override
  int get contentId;
  @override
  int get contentTypeId;
  @override
  String get saleItem;
  @override
  String get saleItemCost;
  @override
  String get restDay;
  @override
  String get scale;
  @override
  String get creditCard;
  @override
  String get openTime;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingDetailImplCopyWith<_$ShoppingDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
