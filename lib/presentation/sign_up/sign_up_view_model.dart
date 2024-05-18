import 'package:flutter/material.dart';
import 'package:kovel_app/domain/use_case/update_user_name_use_case.dart';

class SignUpViewModel with ChangeNotifier {
  final UpdateUserNameUseCase _updateUserNameUseCase;

  SignUpViewModel({required UpdateUserNameUseCase updateUserNameUseCase})
      : _updateUserNameUseCase = updateUserNameUseCase;

  Future<void> clickSignUpButton({required String name}) async {
    await _updateUserNameUseCase.execute(name: name);
  }
}
