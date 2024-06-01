// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleDate _$ScheduleDateFromJson(Map<String, dynamic> json) {
  return _ScheduleDate.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDate {
  int get day => throw _privateConstructorUsedError;
  List<Schedule?> get scheduleList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleDateCopyWith<ScheduleDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDateCopyWith<$Res> {
  factory $ScheduleDateCopyWith(
          ScheduleDate value, $Res Function(ScheduleDate) then) =
      _$ScheduleDateCopyWithImpl<$Res, ScheduleDate>;
  @useResult
  $Res call({int day, List<Schedule?> scheduleList});
}

/// @nodoc
class _$ScheduleDateCopyWithImpl<$Res, $Val extends ScheduleDate>
    implements $ScheduleDateCopyWith<$Res> {
  _$ScheduleDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? scheduleList = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleList: null == scheduleList
          ? _value.scheduleList
          : scheduleList // ignore: cast_nullable_to_non_nullable
              as List<Schedule?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleDateImplCopyWith<$Res>
    implements $ScheduleDateCopyWith<$Res> {
  factory _$$ScheduleDateImplCopyWith(
          _$ScheduleDateImpl value, $Res Function(_$ScheduleDateImpl) then) =
      __$$ScheduleDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, List<Schedule?> scheduleList});
}

/// @nodoc
class __$$ScheduleDateImplCopyWithImpl<$Res>
    extends _$ScheduleDateCopyWithImpl<$Res, _$ScheduleDateImpl>
    implements _$$ScheduleDateImplCopyWith<$Res> {
  __$$ScheduleDateImplCopyWithImpl(
      _$ScheduleDateImpl _value, $Res Function(_$ScheduleDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? scheduleList = null,
  }) {
    return _then(_$ScheduleDateImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleList: null == scheduleList
          ? _value._scheduleList
          : scheduleList // ignore: cast_nullable_to_non_nullable
              as List<Schedule?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleDateImpl implements _ScheduleDate {
  const _$ScheduleDateImpl(
      {required this.day, required final List<Schedule?> scheduleList})
      : _scheduleList = scheduleList;

  factory _$ScheduleDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDateImplFromJson(json);

  @override
  final int day;
  final List<Schedule?> _scheduleList;
  @override
  List<Schedule?> get scheduleList {
    if (_scheduleList is EqualUnmodifiableListView) return _scheduleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleList);
  }

  @override
  String toString() {
    return 'ScheduleDate(day: $day, scheduleList: $scheduleList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDateImpl &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality()
                .equals(other._scheduleList, _scheduleList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(_scheduleList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDateImplCopyWith<_$ScheduleDateImpl> get copyWith =>
      __$$ScheduleDateImplCopyWithImpl<_$ScheduleDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDateImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDate implements ScheduleDate {
  const factory _ScheduleDate(
      {required final int day,
      required final List<Schedule?> scheduleList}) = _$ScheduleDateImpl;

  factory _ScheduleDate.fromJson(Map<String, dynamic> json) =
      _$ScheduleDateImpl.fromJson;

  @override
  int get day;
  @override
  List<Schedule?> get scheduleList;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleDateImplCopyWith<_$ScheduleDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
