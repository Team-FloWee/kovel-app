import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';

part 'user_plan.freezed.dart';
part 'user_plan.g.dart';

@freezed
class UserPlan with _$UserPlan {
  const factory UserPlan({
    required String userId,
    required List<ScheduleDate> dateList,
  }) = _UserPlan;

  factory UserPlan.fromJson(Map<String, Object?> json) =>
      _$UserPlanFromJson(json);
}
