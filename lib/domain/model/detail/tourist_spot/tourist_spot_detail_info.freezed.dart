// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tourist_spot_detail_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TouristSpotDetailInfo _$TouristSpotDetailInfoFromJson(
    Map<String, dynamic> json) {
  return _TouristSpotDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$TouristSpotDetailInfo {
  int get contentId => throw _privateConstructorUsedError;
  int get contentTypeId => throw _privateConstructorUsedError;
  String get infoName => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TouristSpotDetailInfoCopyWith<TouristSpotDetailInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TouristSpotDetailInfoCopyWith<$Res> {
  factory $TouristSpotDetailInfoCopyWith(TouristSpotDetailInfo value,
          $Res Function(TouristSpotDetailInfo) then) =
      _$TouristSpotDetailInfoCopyWithImpl<$Res, TouristSpotDetailInfo>;
  @useResult
  $Res call(
      {int contentId, int contentTypeId, String infoName, String infoText});
}

/// @nodoc
class _$TouristSpotDetailInfoCopyWithImpl<$Res,
        $Val extends TouristSpotDetailInfo>
    implements $TouristSpotDetailInfoCopyWith<$Res> {
  _$TouristSpotDetailInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? infoName = null,
    Object? infoText = null,
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
      infoName: null == infoName
          ? _value.infoName
          : infoName // ignore: cast_nullable_to_non_nullable
              as String,
      infoText: null == infoText
          ? _value.infoText
          : infoText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TouristSpotDetailInfoImplCopyWith<$Res>
    implements $TouristSpotDetailInfoCopyWith<$Res> {
  factory _$$TouristSpotDetailInfoImplCopyWith(
          _$TouristSpotDetailInfoImpl value,
          $Res Function(_$TouristSpotDetailInfoImpl) then) =
      __$$TouristSpotDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId, int contentTypeId, String infoName, String infoText});
}

/// @nodoc
class __$$TouristSpotDetailInfoImplCopyWithImpl<$Res>
    extends _$TouristSpotDetailInfoCopyWithImpl<$Res,
        _$TouristSpotDetailInfoImpl>
    implements _$$TouristSpotDetailInfoImplCopyWith<$Res> {
  __$$TouristSpotDetailInfoImplCopyWithImpl(_$TouristSpotDetailInfoImpl _value,
      $Res Function(_$TouristSpotDetailInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? infoName = null,
    Object? infoText = null,
  }) {
    return _then(_$TouristSpotDetailInfoImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      infoName: null == infoName
          ? _value.infoName
          : infoName // ignore: cast_nullable_to_non_nullable
              as String,
      infoText: null == infoText
          ? _value.infoText
          : infoText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TouristSpotDetailInfoImpl implements _TouristSpotDetailInfo {
  const _$TouristSpotDetailInfoImpl(
      {required this.contentId,
      required this.contentTypeId,
      required this.infoName,
      required this.infoText});

  factory _$TouristSpotDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TouristSpotDetailInfoImplFromJson(json);

  @override
  final int contentId;
  @override
  final int contentTypeId;
  @override
  final String infoName;
  @override
  final String infoText;

  @override
  String toString() {
    return 'TouristSpotDetailInfo(contentId: $contentId, contentTypeId: $contentTypeId, infoName: $infoName, infoText: $infoText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TouristSpotDetailInfoImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.infoName, infoName) ||
                other.infoName == infoName) &&
            (identical(other.infoText, infoText) ||
                other.infoText == infoText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentId, contentTypeId, infoName, infoText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TouristSpotDetailInfoImplCopyWith<_$TouristSpotDetailInfoImpl>
      get copyWith => __$$TouristSpotDetailInfoImplCopyWithImpl<
          _$TouristSpotDetailInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TouristSpotDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _TouristSpotDetailInfo implements TouristSpotDetailInfo {
  const factory _TouristSpotDetailInfo(
      {required final int contentId,
      required final int contentTypeId,
      required final String infoName,
      required final String infoText}) = _$TouristSpotDetailInfoImpl;

  factory _TouristSpotDetailInfo.fromJson(Map<String, dynamic> json) =
      _$TouristSpotDetailInfoImpl.fromJson;

  @override
  int get contentId;
  @override
  int get contentTypeId;
  @override
  String get infoName;
  @override
  String get infoText;
  @override
  @JsonKey(ignore: true)
  _$$TouristSpotDetailInfoImplCopyWith<_$TouristSpotDetailInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
