import 'package:kovel_app/domain/repository/user_repository.dart';

class CheckUserDuplicatedUseCase {
  final UserRepository _userRepository;

  CheckUserDuplicatedUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<bool> execute({required String userId}) async {
    final result = _userRepository.existUser(userId: userId);
    return result;
  }
}
