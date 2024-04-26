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
  String get takeTime => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;
  List<CourseDetailInfo> get courseDetailInfoList =>
      throw _privateConstructorUsedError;

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
      {String takeTime,
      String distance,
      List<CourseDetailInfo> courseDetailInfoList});
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
    Object? takeTime = null,
    Object? distance = null,
    Object? courseDetailInfoList = null,
  }) {
    return _then(_value.copyWith(
      takeTime: null == takeTime
          ? _value.takeTime
          : takeTime // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      courseDetailInfoList: null == courseDetailInfoList
          ? _value.courseDetailInfoList
          : courseDetailInfoList // ignore: cast_nullable_to_non_nullable
              as List<CourseDetailInfo>,
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
      {String takeTime,
      String distance,
      List<CourseDetailInfo> courseDetailInfoList});
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
    Object? takeTime = null,
    Object? distance = null,
    Object? courseDetailInfoList = null,
  }) {
    return _then(_$CourseDetailImpl(
      takeTime: null == takeTime
          ? _value.takeTime
          : takeTime // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      courseDetailInfoList: null == courseDetailInfoList
          ? _value._courseDetailInfoList
          : courseDetailInfoList // ignore: cast_nullable_to_non_nullable
              as List<CourseDetailInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailImpl implements _CourseDetail {
  const _$CourseDetailImpl(
      {required this.takeTime,
      required this.distance,
      required final List<CourseDetailInfo> courseDetailInfoList})
      : _courseDetailInfoList = courseDetailInfoList;

  factory _$CourseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailImplFromJson(json);

  @override
  final String takeTime;
  @override
  final String distance;
  final List<CourseDetailInfo> _courseDetailInfoList;
  @override
  List<CourseDetailInfo> get courseDetailInfoList {
    if (_courseDetailInfoList is EqualUnmodifiableListView)
      return _courseDetailInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courseDetailInfoList);
  }

  @override
  String toString() {
    return 'CourseDetail(takeTime: $takeTime, distance: $distance, courseDetailInfoList: $courseDetailInfoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailImpl &&
            (identical(other.takeTime, takeTime) ||
                other.takeTime == takeTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality()
                .equals(other._courseDetailInfoList, _courseDetailInfoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, takeTime, distance,
      const DeepCollectionEquality().hash(_courseDetailInfoList));

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
          {required final String takeTime,
          required final String distance,
          required final List<CourseDetailInfo> courseDetailInfoList}) =
      _$CourseDetailImpl;

  factory _CourseDetail.fromJson(Map<String, dynamic> json) =
      _$CourseDetailImpl.fromJson;

  @override
  String get takeTime;
  @override
  String get distance;
  @override
  List<CourseDetailInfo> get courseDetailInfoList;
  @override
  @JsonKey(ignore: true)
  _$$CourseDetailImplCopyWith<_$CourseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
