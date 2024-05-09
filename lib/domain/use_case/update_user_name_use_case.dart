import 'package:kovel_app/domain/repository/user_repository.dart';

class UpdateUserNameUseCase {
  final UserRepository _userRepository;

  UpdateUserNameUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<bool> execute({required String id, required String name}) async {
    final user = (await _userRepository.getUser(id: id)).copyWith(name: name);
    final result = await _userRepository.updateUser(user: user);
    return result;
  }
}