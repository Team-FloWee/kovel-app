// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPlan _$UserPlanFromJson(Map<String, dynamic> json) {
  return _UserPlan.fromJson(json);
}

/// @nodoc
mixin _$UserPlan {
  String get userId => throw _privateConstructorUsedError;
  List<PlanDate> get planList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPlanCopyWith<UserPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlanCopyWith<$Res> {
  factory $UserPlanCopyWith(UserPlan value, $Res Function(UserPlan) then) =
      _$UserPlanCopyWithImpl<$Res, UserPlan>;
  @useResult
  $Res call({String userId, List<PlanDate> planList});
}

/// @nodoc
class _$UserPlanCopyWithImpl<$Res, $Val extends UserPlan>
    implements $UserPlanCopyWith<$Res> {
  _$UserPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? planList = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      planList: null == planList
          ? _value.planList
          : planList // ignore: cast_nullable_to_non_nullable
              as List<PlanDate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPlanImplCopyWith<$Res>
    implements $UserPlanCopyWith<$Res> {
  factory _$$UserPlanImplCopyWith(
          _$UserPlanImpl value, $Res Function(_$UserPlanImpl) then) =
      __$$UserPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, List<PlanDate> planList});
}

/// @nodoc
class __$$UserPlanImplCopyWithImpl<$Res>
    extends _$UserPlanCopyWithImpl<$Res, _$UserPlanImpl>
    implements _$$UserPlanImplCopyWith<$Res> {
  __$$UserPlanImplCopyWithImpl(
      _$UserPlanImpl _value, $Res Function(_$UserPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? planList = null,
  }) {
    return _then(_$UserPlanImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      planList: null == planList
          ? _value._planList
          : planList // ignore: cast_nullable_to_non_nullable
              as List<PlanDate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPlanImpl implements _UserPlan {
  const _$UserPlanImpl(
      {required this.userId, required final List<PlanDate> planList})
      : _planList = planList;

  factory _$UserPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPlanImplFromJson(json);

  @override
  final String userId;
  final List<PlanDate> _planList;
  @override
  List<PlanDate> get planList {
    if (_planList is EqualUnmodifiableListView) return _planList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planList);
  }

  @override
  String toString() {
    return 'UserPlan(userId: $userId, planList: $planList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._planList, _planList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_planList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlanImplCopyWith<_$UserPlanImpl> get copyWith =>
      __$$UserPlanImplCopyWithImpl<_$UserPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPlanImplToJson(
      this,
    );
  }
}

abstract class _UserPlan implements UserPlan {
  const factory _UserPlan(
      {required final String userId,
      required final List<PlanDate> planList}) = _$UserPlanImpl;

  factory _UserPlan.fromJson(Map<String, dynamic> json) =
      _$UserPlanImpl.fromJson;

  @override
  String get userId;
  @override
  List<PlanDate> get planList;
  @override
  @JsonKey(ignore: true)
  _$$UserPlanImplCopyWith<_$UserPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
