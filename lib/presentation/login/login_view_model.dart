import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/use_case/auth/login_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/logout_use_case.dart';

class LoginViewModel with ChangeNotifier {
  LoginUseCase _loginUseCase;
  LogoutUseCase _logoutUseCase;

  LoginViewModel({required LoginUseCase loginUseCase, required LogoutUseCase logoutUseCase})
      : _loginUseCase = loginUseCase, _logoutUseCase = logoutUseCase;


  bool isLogined = false;

  Future<bool> login({required LoginPlatform platform}) async {
    isLogined = await _loginUseCase.execute(platform: platform);
    notifyListeners();
    return isLogined;
  }

  Future<void> logout({required LoginPlatform platform}) async {
    isLogined = await _logoutUseCase.execute(platform: platform);
    notifyListeners();
  }
}

