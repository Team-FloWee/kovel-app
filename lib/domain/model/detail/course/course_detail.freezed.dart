// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseDetail _$CourseDetailFromJson(Map<String, dynamic> json) {
  return _CourseDetail.fromJson(json);
}

/// @nodoc
mixin _$CourseDetail {
  int get contentId => throw _privateConstructorUsedError;
  int get contentTypeId => throw _privateConstructorUsedError;
  String get takeTime => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseDetailCopyWith<CourseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailCopyWith<$Res> {
  factory $CourseDetailCopyWith(
          CourseDetail value, $Res Function(CourseDetail) then) =
      _$CourseDetailCopyWithImpl<$Res, CourseDetail>;
  @useResult
  $Res call(
      {int contentId, int contentTypeId, String takeTime, String distance});
}

/// @nodoc
class _$CourseDetailCopyWithImpl<$Res, $Val extends CourseDetail>
    implements $CourseDetailCopyWith<$Res> {
  _$CourseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? takeTime = null,
    Object? distance = null,
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
      takeTime: null == takeTime
          ? _value.takeTime
          : takeTime // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseDetailImplCopyWith<$Res>
    implements $CourseDetailCopyWith<$Res> {
  factory _$$CourseDetailImplCopyWith(
          _$CourseDetailImpl value, $Res Function(_$CourseDetailImpl) then) =
      __$$CourseDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contentId, int contentTypeId, String takeTime, String distance});
}

/// @nodoc
class __$$CourseDetailImplCopyWithImpl<$Res>
    extends _$CourseDetailCopyWithImpl<$Res, _$CourseDetailImpl>
    implements _$$CourseDetailImplCopyWith<$Res> {
  __$$CourseDetailImplCopyWithImpl(
      _$CourseDetailImpl _value, $Res Function(_$CourseDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? takeTime = null,
    Object? distance = null,
  }) {
    return _then(_$CourseDetailImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      takeTime: null == takeTime
          ? _value.takeTime
          : takeTime // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailImpl implements _CourseDetail {
  const _$CourseDetailImpl(
      {required this.contentId,
      required this.contentTypeId,
      required this.takeTime,
      required this.distance});

  factory _$CourseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailImplFromJson(json);

  @override
  final int contentId;
  @override
  final int contentTypeId;
  @override
  final String takeTime;
  @override
  final String distance;

  @override
  String toString() {
    return 'CourseDetail(contentId: $contentId, contentTypeId: $contentTypeId, takeTime: $takeTime, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.takeTime, takeTime) ||
                other.takeTime == takeTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentId, contentTypeId, takeTime, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailImplCopyWith<_$CourseDetailImpl> get copyWith =>
      __$$CourseDetailImplCopyWithImpl<_$CourseDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailImplToJson(
      this,
    );
  }
}

abstract class _CourseDetail implements CourseDetail {
  const factory _CourseDetail(
      {required final int contentId,
      required final int contentTypeId,
      required final String takeTime,
      required final String distance}) = _$CourseDetailImpl;

  factory _CourseDetail.fromJson(Map<String, dynamic> json) =
      _$CourseDetailImpl.fromJson;

  @override
  int get contentId;
  @override
  int get contentTypeId;
  @override
  String get takeTime;
  @override
  String get distance;
  @override
  @JsonKey(ignore: true)
  _$$CourseDetailImplCopyWith<_$CourseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
