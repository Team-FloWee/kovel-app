import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';
import 'package:kovel_app/domain/use_case/update_user_name_use_case.dart';

class SignUpViewModel with ChangeNotifier {
  final UpdateUserNameUseCase _updateUserNameUseCase;

  Future<void> clickSignUpButton(
      {required User user,
      required String userId,
      required String name}) async {
    await _updateUserNameUseCase.execute(userId: userId, name: name);
  }

  SignUpViewModel({
    required UpdateUserNameUseCase updateUserNameUseCase,
    required UserRepository userRepository,
  }) : _updateUserNameUseCase = updateUserNameUseCase;
}
