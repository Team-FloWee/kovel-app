import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/schedule.dart';

part 'schedule_date.freezed.dart';
part 'schedule_date.g.dart';

@freezed
class ScheduleDate with _$ScheduleDate {
  const factory ScheduleDate({
    required List<Schedule> scheduleList,
  }) = _ScheduleDate;

  factory ScheduleDate.fromJson(Map<String, Object?> json) =>
      _$ScheduleDateFromJson(json);
}
