import 'package:kovel_app/data/data_source/schedule_data_source.dart';
import 'package:kovel_app/domain/model/plan.dart';
import 'package:kovel_app/domain/model/user_plan.dart';
import 'package:kovel_app/domain/repository/schedule_list_repository.dart';

class ScheduleListRepositoryImpl implements ScheduleListRepository {
  final ScheduleDataSource _scheduleDataSource;

  ScheduleListRepositoryImpl({
    required ScheduleDataSource scheduleDataSource,
  }) : _scheduleDataSource = scheduleDataSource;

  @override
  Future<UserPlan> getScheduleList({required String userId}) async {
    return await _scheduleDataSource.getUserPlan(userId: userId);
  }

  @override
  Future<void> updateSchedule(
      {required String userId, required List<Plan> planList}) async {
    await _scheduleDataSource.updateSchedule(
        userId: userId, planList: planList);
  }
}
