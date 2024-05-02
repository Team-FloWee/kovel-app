// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_detail_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseDetailInfo _$CourseDetailInfoFromJson(Map<String, dynamic> json) {
  return _CourseDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$CourseDetailInfo {
  int get contentId => throw _privateConstructorUsedError;
  int get contentTypeId => throw _privateConstructorUsedError;
  int get subContentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseDetailInfoCopyWith<CourseDetailInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailInfoCopyWith<$Res> {
  factory $CourseDetailInfoCopyWith(
          CourseDetailInfo value, $Res Function(CourseDetailInfo) then) =
      _$CourseDetailInfoCopyWithImpl<$Res, CourseDetailInfo>;
  @useResult
  $Res call(
      {int contentId,
      int contentTypeId,
      int subContentId,
      String name,
      String overview,
      String imagePath});
}

/// @nodoc
class _$CourseDetailInfoCopyWithImpl<$Res, $Val extends CourseDetailInfo>
    implements $CourseDetailInfoCopyWith<$Res> {
  _$CourseDetailInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? subContentId = null,
    Object? name = null,
    Object? overview = null,
    Object? imagePath = null,
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
      subContentId: null == subContentId
          ? _value.subContentId
          : subContentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseDetailInfoImplCopyWith<$Res>
    implements $CourseDetailInfoCopyWith<$Res> {
  factory _$$CourseDetailInfoImplCopyWith(_$CourseDetailInfoImpl value,
          $Res Function(_$CourseDetailInfoImpl) then) =
      __$$CourseDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId,
      int contentTypeId,
      int subContentId,
      String name,
      String overview,
      String imagePath});
}

/// @nodoc
class __$$CourseDetailInfoImplCopyWithImpl<$Res>
    extends _$CourseDetailInfoCopyWithImpl<$Res, _$CourseDetailInfoImpl>
    implements _$$CourseDetailInfoImplCopyWith<$Res> {
  __$$CourseDetailInfoImplCopyWithImpl(_$CourseDetailInfoImpl _value,
      $Res Function(_$CourseDetailInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? subContentId = null,
    Object? name = null,
    Object? overview = null,
    Object? imagePath = null,
  }) {
    return _then(_$CourseDetailInfoImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      subContentId: null == subContentId
          ? _value.subContentId
          : subContentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailInfoImpl implements _CourseDetailInfo {
  const _$CourseDetailInfoImpl(
      {required this.contentId,
      required this.contentTypeId,
      required this.subContentId,
      required this.name,
      required this.overview,
      required this.imagePath});

  factory _$CourseDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailInfoImplFromJson(json);

  @override
  final int contentId;
  @override
  final int contentTypeId;
  @override
  final int subContentId;
  @override
  final String name;
  @override
  final String overview;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'CourseDetailInfo(contentId: $contentId, contentTypeId: $contentTypeId, subContentId: $subContentId, name: $name, overview: $overview, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailInfoImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.subContentId, subContentId) ||
                other.subContentId == subContentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentId, contentTypeId,
      subContentId, name, overview, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailInfoImplCopyWith<_$CourseDetailInfoImpl> get copyWith =>
      __$$CourseDetailInfoImplCopyWithImpl<_$CourseDetailInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _CourseDetailInfo implements CourseDetailInfo {
  const factory _CourseDetailInfo(
      {required final int contentId,
      required final int contentTypeId,
      required final int subContentId,
      required final String name,
      required final String overview,
      required final String imagePath}) = _$CourseDetailInfoImpl;

  factory _CourseDetailInfo.fromJson(Map<String, dynamic> json) =
      _$CourseDetailInfoImpl.fromJson;

  @override
  int get contentId;
  @override
  int get contentTypeId;
  @override
  int get subContentId;
  @override
  String get name;
  @override
  String get overview;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$CourseDetailInfoImplCopyWith<_$CourseDetailInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
