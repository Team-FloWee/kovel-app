import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/check_user_duplicated_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/create_user_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/login_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/logout_use_case.dart';

class LoginViewModel with ChangeNotifier {
  LoginUseCase _loginUseCase;
  LogoutUseCase _logoutUseCase;
  CheckUserDuplicatedUseCase _checkUserDuplicatedUseCase;
  CreateUserUseCase _createUserUseCase;

  LoginViewModel(
      {required LoginUseCase loginUseCase,
      required LogoutUseCase logoutUseCase,
      required CheckUserDuplicatedUseCase checkUserDuplicatedUseCase,
      required CreateUserUseCase createUserUseCase})
      : _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        _checkUserDuplicatedUseCase = checkUserDuplicatedUseCase,
        _createUserUseCase = createUserUseCase;

  User? _user;
  User? get user => _user;

  bool _isNewUser = true;
  bool get isNewUser => _isNewUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login({required LoginPlatform platform}) async {
    _isLoading = true;
    notifyListeners();
    _user = await _loginUseCase.execute(platform: platform);
    final result = await _checkUserDuplicatedUseCase.execute(id: _user!.userId);
    if (result == true) {
      _isNewUser = false;
    } else {
      await _createUserUseCase.execute(user: _user!);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _logoutUseCase.execute();
    notifyListeners();
  }
}
