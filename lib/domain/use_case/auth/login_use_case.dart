import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<bool> execute({required LoginPlatform platform}) async {
    final result = _userRepository.login(platform: platform);
    return result;
  }
}
