import 'package:kovel_app/domain/model/plan.dart';
import 'package:kovel_app/domain/model/user_plan.dart';

abstract interface class ScheduleDataSource {
  Future<void> createUserPlan({required String userId});
  Future<UserPlan> getUserPlan({required String userId});
  Future<void> updateSchedule(
      {required String userId, required List<Plan> planList});
}
