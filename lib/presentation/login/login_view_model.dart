import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/login/google_login.dart';
import 'package:kovel_app/presentation/login/kakao_login.dart';
import 'package:kovel_app/presentation/login/social_login.dart';

enum LoginPlatform {
  google('google', 0),
  kakao('kakao', 1);

  const LoginPlatform(this.platform, this.platformIndex);
  final String platform;
  final int platformIndex;
}

class LoginViewModel with ChangeNotifier {
  final List<SocialLogin> _socialLoginMethod = [
    GoogleLogin(),
    KakaoLogin(),
  ];
  bool isLogined = false;

  Future login({required LoginPlatform platform}) async {
    isLogined = await _socialLoginMethod[platform.platformIndex].login();
    notifyListeners();
  }

  Future logout({required LoginPlatform platform}) async {
    isLogined = await _socialLoginMethod[platform.platformIndex].logout();
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
