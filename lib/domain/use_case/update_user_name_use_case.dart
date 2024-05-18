import 'package:kovel_app/domain/repository/user_repository.dart';

class UpdateUserNameUseCase {
  final UserRepository _userRepository;

  UpdateUserNameUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<bool> execute({required String name}) async {
    final result = await _userRepository.updateUserName(name: name);
    return result;
  }
}
