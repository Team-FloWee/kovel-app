import 'package:kovel_app/domain/repository/schedule_list_repository.dart';

class GetScheduleListUseCase {
  final ScheduleListRepository _scheduleListRepository;

  GetScheduleListUseCase({
    required ScheduleListRepository scheduleListRepository,
  }) : _scheduleListRepository = scheduleListRepository;

  Future<void> execute({required String userId}) async {
    await _scheduleListRepository.getScheduleList(userId: userId);
  }
}
