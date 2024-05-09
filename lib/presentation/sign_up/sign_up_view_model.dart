import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/auth/current_user_service.dart';
import 'package:kovel_app/domain/use_case/update_user_name_use_case.dart';

class SignUpViewModel with ChangeNotifier {
  final UpdateUserNameUseCase _updateUserNameUseCase;

  SignUpViewModel({required UpdateUserNameUseCase updateUserNameUseCase}) : _updateUserNameUseCase = updateUserNameUseCase;

  Future<void> clickSignUpButton({required String name}) async {
    final userId = CurrentUserService().getUserId();
    final result = await _updateUserNameUseCase.execute(id: userId, name: name);
  }
}