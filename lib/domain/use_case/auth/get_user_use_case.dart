import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<User> execute({required String userId}) async {
    final result = await _userRepository.getUser(userId: userId);
    return result;
  }
}
