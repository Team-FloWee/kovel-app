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
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;

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
  $Res call({int contentId, int contentTypeId, String name, String overview});
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
    Object? name = null,
    Object? overview = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
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
  $Res call({int contentId, int contentTypeId, String name, String overview});
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
    Object? name = null,
    Object? overview = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
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
      required this.name,
      required this.overview});

  factory _$CourseDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailInfoImplFromJson(json);

  @override
  final int contentId;
  @override
  final int contentTypeId;
  @override
  final String name;
  @override
  final String overview;

  @override
  String toString() {
    return 'CourseDetailInfo(contentId: $contentId, contentTypeId: $contentTypeId, name: $name, overview: $overview)';
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentId, contentTypeId, name, overview);

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
      required final String name,
      required final String overview}) = _$CourseDetailInfoImpl;

  factory _CourseDetailInfo.fromJson(Map<String, dynamic> json) =
      _$CourseDetailInfoImpl.fromJson;

  @override
  int get contentId;
  @override
  int get contentTypeId;
  @override
  String get name;
  @override
  String get overview;
  @override
  @JsonKey(ignore: true)
  _$$CourseDetailInfoImplCopyWith<_$CourseDetailInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
