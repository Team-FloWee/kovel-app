// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'festival_detail_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FestivalDetailInfo _$FestivalDetailInfoFromJson(Map<String, dynamic> json) {
  return _FestivalDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$FestivalDetailInfo {
  int get contentId => throw _privateConstructorUsedError;
  ContentType get contentType => throw _privateConstructorUsedError;
  String get infoName => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FestivalDetailInfoCopyWith<FestivalDetailInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FestivalDetailInfoCopyWith<$Res> {
  factory $FestivalDetailInfoCopyWith(
          FestivalDetailInfo value, $Res Function(FestivalDetailInfo) then) =
      _$FestivalDetailInfoCopyWithImpl<$Res, FestivalDetailInfo>;
  @useResult
  $Res call(
      {int contentId,
      ContentType contentType,
      String infoName,
      String infoText});
}

/// @nodoc
class _$FestivalDetailInfoCopyWithImpl<$Res, $Val extends FestivalDetailInfo>
    implements $FestivalDetailInfoCopyWith<$Res> {
  _$FestivalDetailInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentType = null,
    Object? infoName = null,
    Object? infoText = null,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType,
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
abstract class _$$FestivalDetailInfoImplCopyWith<$Res>
    implements $FestivalDetailInfoCopyWith<$Res> {
  factory _$$FestivalDetailInfoImplCopyWith(_$FestivalDetailInfoImpl value,
          $Res Function(_$FestivalDetailInfoImpl) then) =
      __$$FestivalDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId,
      ContentType contentType,
      String infoName,
      String infoText});
}

/// @nodoc
class __$$FestivalDetailInfoImplCopyWithImpl<$Res>
    extends _$FestivalDetailInfoCopyWithImpl<$Res, _$FestivalDetailInfoImpl>
    implements _$$FestivalDetailInfoImplCopyWith<$Res> {
  __$$FestivalDetailInfoImplCopyWithImpl(_$FestivalDetailInfoImpl _value,
      $Res Function(_$FestivalDetailInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentType = null,
    Object? infoName = null,
    Object? infoText = null,
  }) {
    return _then(_$FestivalDetailInfoImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType,
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
class _$FestivalDetailInfoImpl implements _FestivalDetailInfo {
  const _$FestivalDetailInfoImpl(
      {required this.contentId,
      required this.contentType,
      required this.infoName,
      required this.infoText});

  factory _$FestivalDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FestivalDetailInfoImplFromJson(json);

  @override
  final int contentId;
  @override
  final ContentType contentType;
  @override
  final String infoName;
  @override
  final String infoText;

  @override
  String toString() {
    return 'FestivalDetailInfo(contentId: $contentId, contentType: $contentType, infoName: $infoName, infoText: $infoText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FestivalDetailInfoImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.infoName, infoName) ||
                other.infoName == infoName) &&
            (identical(other.infoText, infoText) ||
                other.infoText == infoText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentId, contentType, infoName, infoText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FestivalDetailInfoImplCopyWith<_$FestivalDetailInfoImpl> get copyWith =>
      __$$FestivalDetailInfoImplCopyWithImpl<_$FestivalDetailInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FestivalDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _FestivalDetailInfo implements FestivalDetailInfo {
  const factory _FestivalDetailInfo(
      {required final int contentId,
      required final ContentType contentType,
      required final String infoName,
      required final String infoText}) = _$FestivalDetailInfoImpl;

  factory _FestivalDetailInfo.fromJson(Map<String, dynamic> json) =
      _$FestivalDetailInfoImpl.fromJson;

  @override
  int get contentId;
  @override
  ContentType get contentType;
  @override
  String get infoName;
  @override
  String get infoText;
  @override
  @JsonKey(ignore: true)
  _$$FestivalDetailInfoImplCopyWith<_$FestivalDetailInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
