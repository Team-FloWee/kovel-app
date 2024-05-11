import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class UpdateArchivedListUseCase {
  final UserRepository _userRepository;

  UpdateArchivedListUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<void> execute({
    required User user,
    required Archived clickedArchived,
    required bool isArchived,
  }) async {
    try {
      if (isArchived) {
        user.archivedList.add(clickedArchived);
      } else {
        user.archivedList.removeWhere((archived) => archived.id == clickedArchived.id);
      }
      await _userRepository.updateUser(user: user);
    } catch (e) {
      throw Exception('Error updating archived list: $e');
    }
  }
}