import 'package:kovel_app/domain/model/plan.dart';
import 'package:kovel_app/domain/model/user_plan.dart';

abstract interface class ScheduleListRepository {
  Future<UserPlan> getScheduleList({required String userId});
  Future<void> updateSchedule(
      {required String userId, required List<Plan> planList});
}
