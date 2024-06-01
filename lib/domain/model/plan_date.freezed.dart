// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlanDate _$PlanDateFromJson(Map<String, dynamic> json) {
  return _PlanDate.fromJson(json);
}

/// @nodoc
mixin _$PlanDate {
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  List<ScheduleDate?> get dateList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanDateCopyWith<PlanDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanDateCopyWith<$Res> {
  factory $PlanDateCopyWith(PlanDate value, $Res Function(PlanDate) then) =
      _$PlanDateCopyWithImpl<$Res, PlanDate>;
  @useResult
  $Res call(
      {String title,
      DateTime startDate,
      DateTime endDate,
      List<ScheduleDate?> dateList});
}

/// @nodoc
class _$PlanDateCopyWithImpl<$Res, $Val extends PlanDate>
    implements $PlanDateCopyWith<$Res> {
  _$PlanDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? dateList = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateList: null == dateList
          ? _value.dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDate?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanDateImplCopyWith<$Res>
    implements $PlanDateCopyWith<$Res> {
  factory _$$PlanDateImplCopyWith(
          _$PlanDateImpl value, $Res Function(_$PlanDateImpl) then) =
      __$$PlanDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      DateTime startDate,
      DateTime endDate,
      List<ScheduleDate?> dateList});
}

/// @nodoc
class __$$PlanDateImplCopyWithImpl<$Res>
    extends _$PlanDateCopyWithImpl<$Res, _$PlanDateImpl>
    implements _$$PlanDateImplCopyWith<$Res> {
  __$$PlanDateImplCopyWithImpl(
      _$PlanDateImpl _value, $Res Function(_$PlanDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? dateList = null,
  }) {
    return _then(_$PlanDateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateList: null == dateList
          ? _value._dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDate?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanDateImpl implements _PlanDate {
  const _$PlanDateImpl(
      {required this.title,
      required this.startDate,
      required this.endDate,
      required final List<ScheduleDate?> dateList})
      : _dateList = dateList;

  factory _$PlanDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanDateImplFromJson(json);

  @override
  final String title;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<ScheduleDate?> _dateList;
  @override
  List<ScheduleDate?> get dateList {
    if (_dateList is EqualUnmodifiableListView) return _dateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateList);
  }

  @override
  String toString() {
    return 'PlanDate(title: $title, startDate: $startDate, endDate: $endDate, dateList: $dateList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanDateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._dateList, _dateList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, startDate, endDate,
      const DeepCollectionEquality().hash(_dateList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanDateImplCopyWith<_$PlanDateImpl> get copyWith =>
      __$$PlanDateImplCopyWithImpl<_$PlanDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanDateImplToJson(
      this,
    );
  }
}

abstract class _PlanDate implements PlanDate {
  const factory _PlanDate(
      {required final String title,
      required final DateTime startDate,
      required final DateTime endDate,
      required final List<ScheduleDate?> dateList}) = _$PlanDateImpl;

  factory _PlanDate.fromJson(Map<String, dynamic> json) =
      _$PlanDateImpl.fromJson;

  @override
  String get title;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  List<ScheduleDate?> get dateList;
  @override
  @JsonKey(ignore: true)
  _$$PlanDateImplCopyWith<_$PlanDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
