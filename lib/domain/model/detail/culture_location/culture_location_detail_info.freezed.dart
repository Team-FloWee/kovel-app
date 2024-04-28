// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'culture_location_detail_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CultureLocationDetailInfo _$CultureLocationDetailInfoFromJson(
    Map<String, dynamic> json) {
  return _CultureLocationDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$CultureLocationDetailInfo {
  int get contentId => throw _privateConstructorUsedError;
  int get contentTypeId => throw _privateConstructorUsedError;
  String get infoName => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CultureLocationDetailInfoCopyWith<CultureLocationDetailInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CultureLocationDetailInfoCopyWith<$Res> {
  factory $CultureLocationDetailInfoCopyWith(CultureLocationDetailInfo value,
          $Res Function(CultureLocationDetailInfo) then) =
      _$CultureLocationDetailInfoCopyWithImpl<$Res, CultureLocationDetailInfo>;
  @useResult
  $Res call(
      {int contentId, int contentTypeId, String infoName, String infoText});
}

/// @nodoc
class _$CultureLocationDetailInfoCopyWithImpl<$Res,
        $Val extends CultureLocationDetailInfo>
    implements $CultureLocationDetailInfoCopyWith<$Res> {
  _$CultureLocationDetailInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$CultureLocationDetailInfoImplCopyWith<$Res>
    implements $CultureLocationDetailInfoCopyWith<$Res> {
  factory _$$CultureLocationDetailInfoImplCopyWith(
          _$CultureLocationDetailInfoImpl value,
          $Res Function(_$CultureLocationDetailInfoImpl) then) =
      __$$CultureLocationDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId, int contentTypeId, String infoName, String infoText});
}

/// @nodoc
class __$$CultureLocationDetailInfoImplCopyWithImpl<$Res>
    extends _$CultureLocationDetailInfoCopyWithImpl<$Res,
        _$CultureLocationDetailInfoImpl>
    implements _$$CultureLocationDetailInfoImplCopyWith<$Res> {
  __$$CultureLocationDetailInfoImplCopyWithImpl(
      _$CultureLocationDetailInfoImpl _value,
      $Res Function(_$CultureLocationDetailInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? infoName = null,
    Object? infoText = null,
  }) {
    return _then(_$CultureLocationDetailInfoImpl(
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
class _$CultureLocationDetailInfoImpl implements _CultureLocationDetailInfo {
  const _$CultureLocationDetailInfoImpl(
      {required this.contentId,
      required this.contentTypeId,
      required this.infoName,
      required this.infoText});

  factory _$CultureLocationDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CultureLocationDetailInfoImplFromJson(json);

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
    return 'CultureLocationDetailInfo(contentId: $contentId, contentTypeId: $contentTypeId, infoName: $infoName, infoText: $infoText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CultureLocationDetailInfoImpl &&
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
  _$$CultureLocationDetailInfoImplCopyWith<_$CultureLocationDetailInfoImpl>
      get copyWith => __$$CultureLocationDetailInfoImplCopyWithImpl<
          _$CultureLocationDetailInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CultureLocationDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _CultureLocationDetailInfo implements CultureLocationDetailInfo {
  const factory _CultureLocationDetailInfo(
      {required final int contentId,
      required final int contentTypeId,
      required final String infoName,
      required final String infoText}) = _$CultureLocationDetailInfoImpl;

  factory _CultureLocationDetailInfo.fromJson(Map<String, dynamic> json) =
      _$CultureLocationDetailInfoImpl.fromJson;

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
  _$$CultureLocationDetailInfoImplCopyWith<_$CultureLocationDetailInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
