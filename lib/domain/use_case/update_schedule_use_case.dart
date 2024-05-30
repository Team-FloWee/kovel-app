import 'package:kovel_app/domain/model/schedule.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class UpdateScheduleUseCase {
  final UserRepository _userRepository;

  UpdateScheduleUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> execute(
      {required String userId, required List<Schedule> scheduleList}) async {
    await _userRepository.updateSchedule(
        userId: userId, scheduleList: scheduleList);
  }
}
