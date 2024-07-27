import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/plan.dart';

part 'user_plan.freezed.dart';
part 'user_plan.g.dart';

@freezed
class UserPlan with _$UserPlan {
  @JsonSerializable(explicitToJson: true)
  const factory UserPlan({
    required String userId,
    required List<Plan> planList,
  }) = _UserPlan;

  factory UserPlan.fromJson(Map<String, Object?> json) =>
      _$UserPlanFromJson(json);
}
