import 'package:kovel_app/data/data_source/schedule_data_source.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/repository/schedule_list_repository.dart';

class ScheduleListRepositoryImpl implements ScheduleListRepository {
  final ScheduleDataSource _scheduleDataSource;

  ScheduleListRepositoryImpl({
    required ScheduleDataSource scheduleDataSource,
  }) : _scheduleDataSource = scheduleDataSource;

  @override
  Future<void> getScheduleList({required String userId}) async {
    await _scheduleDataSource.getScheduleList(userId: userId);
  }

  @override
  Future<void> updateSchedule(
      {required String userId, required List<ScheduleDate> planList}) async {
    await _scheduleDataSource.updateSchedule(
        userId: userId, planList: planList);
  }
}
