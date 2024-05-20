import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class UpdateArchivedUseCase {
  final UserRepository _userRepository;

  UpdateArchivedUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<void> execute(
      {required String userId, required List<Archived> archivedList}) async {
    await _userRepository.updateArchivedList(
        userId: userId, archivedList: archivedList);
  }
}
