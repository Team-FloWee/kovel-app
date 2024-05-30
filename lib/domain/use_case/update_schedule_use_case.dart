import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/repository/schedule_list_repository.dart';

class UpdateScheduleUseCase {
  // final UserRepository _userRepository;
  //
  // UpdateScheduleUseCase({
  //   required UserRepository userRepository,
  // }) : _userRepository = userRepository;
  //
  // Future<void> execute(
  //     {required String userId, required List<Schedule> scheduleList}) async {
  //   await _userRepository.updateSchedule(
  //       userId: userId, scheduleList: scheduleList);
  // }

  final ScheduleListRepository _scheduleListRepository;

  UpdateScheduleUseCase({
    required ScheduleListRepository scheduleListRepository,
  }) : _scheduleListRepository = scheduleListRepository;

  Future<void> execute(
      {required String userId, required List<ScheduleDate> dateList}) async {
    await _scheduleListRepository.updateSchedule(
        userId: userId, dateList: dateList);
  }
}
