import 'package:firebase_auth/firebase_auth.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/data/repository_impl/auth/google_auth.dart';
import 'package:kovel_app/data/repository_impl/auth/kakao_auth.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  @override
  Future<bool> login({required LoginPlatform platform}) async {
    bool result = false;
    switch (platform) {
      case LoginPlatform.google:
        result = await GoogleAuth().login();
      case LoginPlatform.kakao:
        result = await KakaoAuth().login();
    }
    return result;
  }

  @override
  Future<bool> logout({required LoginPlatform platform}) async {
    bool result = false;
    switch (platform) {
      case LoginPlatform.google:
        result = await GoogleAuth().logout();
      case LoginPlatform.kakao:
        result = await KakaoAuth().logout();
    }
    await FirebaseAuth.instance.signOut();
    return result;
  }
}
