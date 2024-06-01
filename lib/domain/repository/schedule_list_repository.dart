import 'package:kovel_app/domain/model/schedule_date.dart';

abstract interface class ScheduleListRepository {
  Future<void> getScheduleList({required String userId});
  Future<void> updateSchedule(
      {required String userId, required List<ScheduleDate> planList});
}
