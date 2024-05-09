import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<void> execute({required User user}) async {
    await _userRepository.createUser(user: user);
  }
}
