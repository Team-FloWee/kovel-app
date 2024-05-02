// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unified_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnifiedInfo _$UnifiedInfoFromJson(Map<String, dynamic> json) {
  return _UnifiedInfo.fromJson(json);
}

/// @nodoc
mixin _$UnifiedInfo {
  int get contentId => throw _privateConstructorUsedError;
  ContentType get contentType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  int get subContentId => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get infoName => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifiedInfoCopyWith<UnifiedInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifiedInfoCopyWith<$Res> {
  factory $UnifiedInfoCopyWith(
          UnifiedInfo value, $Res Function(UnifiedInfo) then) =
      _$UnifiedInfoCopyWithImpl<$Res, UnifiedInfo>;
  @useResult
  $Res call(
      {int contentId,
      ContentType contentType,
      String name,
      String overview,
      int subContentId,
      String imagePath,
      String infoName,
      String infoText});
}

/// @nodoc
class _$UnifiedInfoCopyWithImpl<$Res, $Val extends UnifiedInfo>
    implements $UnifiedInfoCopyWith<$Res> {
  _$UnifiedInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentType = null,
    Object? name = null,
    Object? overview = null,
    Object? subContentId = null,
    Object? imagePath = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      subContentId: null == subContentId
          ? _value.subContentId
          : subContentId // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$UnifiedInfoImplCopyWith<$Res>
    implements $UnifiedInfoCopyWith<$Res> {
  factory _$$UnifiedInfoImplCopyWith(
          _$UnifiedInfoImpl value, $Res Function(_$UnifiedInfoImpl) then) =
      __$$UnifiedInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId,
      ContentType contentType,
      String name,
      String overview,
      int subContentId,
      String imagePath,
      String infoName,
      String infoText});
}

/// @nodoc
class __$$UnifiedInfoImplCopyWithImpl<$Res>
    extends _$UnifiedInfoCopyWithImpl<$Res, _$UnifiedInfoImpl>
    implements _$$UnifiedInfoImplCopyWith<$Res> {
  __$$UnifiedInfoImplCopyWithImpl(
      _$UnifiedInfoImpl _value, $Res Function(_$UnifiedInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentType = null,
    Object? name = null,
    Object? overview = null,
    Object? subContentId = null,
    Object? imagePath = null,
    Object? infoName = null,
    Object? infoText = null,
  }) {
    return _then(_$UnifiedInfoImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as ContentType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      subContentId: null == subContentId
          ? _value.subContentId
          : subContentId // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$UnifiedInfoImpl implements _UnifiedInfo {
  const _$UnifiedInfoImpl(
      {required this.contentId,
      required this.contentType,
      required this.name,
      required this.overview,
      required this.subContentId,
      required this.imagePath,
      required this.infoName,
      required this.infoText});

  factory _$UnifiedInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnifiedInfoImplFromJson(json);

  @override
  final int contentId;
  @override
  final ContentType contentType;
  @override
  final String name;
  @override
  final String overview;
  @override
  final int subContentId;
  @override
  final String imagePath;
  @override
  final String infoName;
  @override
  final String infoText;

  @override
  String toString() {
    return 'UnifiedInfo(contentId: $contentId, contentType: $contentType, name: $name, overview: $overview, subContentId: $subContentId, imagePath: $imagePath, infoName: $infoName, infoText: $infoText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnifiedInfoImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.subContentId, subContentId) ||
                other.subContentId == subContentId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.infoName, infoName) ||
                other.infoName == infoName) &&
            (identical(other.infoText, infoText) ||
                other.infoText == infoText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentId, contentType, name,
      overview, subContentId, imagePath, infoName, infoText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnifiedInfoImplCopyWith<_$UnifiedInfoImpl> get copyWith =>
      __$$UnifiedInfoImplCopyWithImpl<_$UnifiedInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnifiedInfoImplToJson(
      this,
    );
  }
}

abstract class _UnifiedInfo implements UnifiedInfo {
  const factory _UnifiedInfo(
      {required final int contentId,
      required final ContentType contentType,
      required final String name,
      required final String overview,
      required final int subContentId,
      required final String imagePath,
      required final String infoName,
      required final String infoText}) = _$UnifiedInfoImpl;

  factory _UnifiedInfo.fromJson(Map<String, dynamic> json) =
      _$UnifiedInfoImpl.fromJson;

  @override
  int get contentId;
  @override
  ContentType get contentType;
  @override
  String get name;
  @override
  String get overview;
  @override
  int get subContentId;
  @override
  String get imagePath;
  @override
  String get infoName;
  @override
  String get infoText;
  @override
  @JsonKey(ignore: true)
  _$$UnifiedInfoImplCopyWith<_$UnifiedInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
