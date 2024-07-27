import 'package:kovel_app/domain/model/plan.dart';
import 'package:kovel_app/domain/repository/schedule_list_repository.dart';

class UpdateScheduleUseCase {
  final ScheduleListRepository _scheduleListRepository;

  UpdateScheduleUseCase({
    required ScheduleListRepository scheduleListRepository,
  }) : _scheduleListRepository = scheduleListRepository;

  Future<void> execute(
      {required String userId, required List<Plan> planList}) async {
    await _scheduleListRepository.updateSchedule(
        userId: userId, planList: planList);
  }
}
