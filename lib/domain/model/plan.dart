import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';

part 'plan.freezed.dart';
part 'plan.g.dart';

@freezed
class Plan with _$Plan {
  @JsonSerializable(explicitToJson: true)
  const factory Plan({
    required String title,
    required DateTime startDate,
    required DateTime endDate,
    required List<ScheduleDate> dateList,
  }) = _Plan;

  factory Plan.fromJson(Map<String, Object?> json) => _$PlanFromJson(json);
}
