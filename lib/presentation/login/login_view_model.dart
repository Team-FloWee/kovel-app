import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/check_user_duplicated_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/create_user_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/get_user_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/login_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/logout_use_case.dart';

class LoginViewModel with ChangeNotifier {
  LoginUseCase _loginUseCase;
  LogoutUseCase _logoutUseCase;
  CheckUserDuplicatedUseCase _checkUserDuplicatedUseCase;
  CreateUserUseCase _createUserUseCase;
  GetUserUseCase _getUserUseCase;

  LoginViewModel(
      {required LoginUseCase loginUseCase,
      required LogoutUseCase logoutUseCase,
      required CheckUserDuplicatedUseCase checkUserDuplicatedUseCase,
      required CreateUserUseCase createUserUseCase,
      required GetUserUseCase getUserUsecase})
      : _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        _checkUserDuplicatedUseCase = checkUserDuplicatedUseCase,
        _createUserUseCase = createUserUseCase,
        _getUserUseCase = getUserUsecase;

  User? _user;
  User? get user => _user;

  bool _isNewUser = true;
  bool get isNewUser => _isNewUser;

  Future<void> login({required LoginPlatform platform}) async {
    _user = await _loginUseCase.execute(platform: platform);
    final result = await _checkUserDuplicatedUseCase.execute(id: _user!.userId);
    if (result == true) {
      _isNewUser = false;
      //유즈케이스 좋아요 불러오기
      final user = await _getUserUseCase.execute(id: _user!.userId);
    } else {
      await _createUserUseCase.execute(user: _user!);
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _logoutUseCase.execute();
    notifyListeners();
  }
}
