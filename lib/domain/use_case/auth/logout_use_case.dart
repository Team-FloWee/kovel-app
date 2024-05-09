import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  LogoutUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<bool> execute({required LoginPlatform platform}) async {
    final result = _userRepository.logout(platform: platform);
    return result;
  }
}
