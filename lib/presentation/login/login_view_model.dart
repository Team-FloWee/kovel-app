import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/login_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/logout_use_case.dart';

class LoginViewModel with ChangeNotifier {
  LoginUseCase _loginUseCase;
  LogoutUseCase _logoutUseCase;

  LoginViewModel({required LoginUseCase loginUseCase, required LogoutUseCase logoutUseCase})
      : _loginUseCase = loginUseCase, _logoutUseCase = logoutUseCase;

  User? _user;
  User? get user => _user;

  bool isLogined = false;

  Future<void> login({required BuildContext context, required LoginPlatform platform}) async {
    _user = await _loginUseCase.execute(platform: platform);
    notifyListeners();
    context.push('/signUp', extra: _user);
  }

  Future<void> logout({required LoginPlatform platform}) async {
    await _logoutUseCase.execute(platform: platform);
    notifyListeners();
  }
}

