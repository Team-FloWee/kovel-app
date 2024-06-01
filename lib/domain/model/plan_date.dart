import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';

part 'plan_date.freezed.dart';
part 'plan_date.g.dart';

@freezed
class PlanDate with _$PlanDate {
  const factory PlanDate({
    required String title,
    required DateTime startDate,
    required DateTime endDate,
    required List<ScheduleDate?> dateList,
  }) = _PlanDate;

  factory PlanDate.fromJson(Map<String, Object?> json) =>
      _$PlanDateFromJson(json);
}
