import 'package:kovel_app/domain/model/user_plan.dart';
import 'package:kovel_app/domain/repository/schedule_list_repository.dart';

class GetScheduleListUseCase {
  final ScheduleListRepository _scheduleListRepository;

  GetScheduleListUseCase({
    required ScheduleListRepository scheduleListRepository,
  }) : _scheduleListRepository = scheduleListRepository;

  Future<UserPlan> execute({required String userId}) async {
    return await _scheduleListRepository.getScheduleList(userId: userId);
  }
}
