import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/data/data_source/firebase/user_data_source.dart';
import 'package:kovel_app/data/repository_impl/auth/google_auth.dart';
import 'package:kovel_app/data/repository_impl/auth/kakao_auth.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource}) : _userDataSource = userDataSource;

  @override
  Future<bool> login({required LoginPlatform platform}) async {
    User? result;
    try {
      switch (platform) {
        case LoginPlatform.google:
          result = await GoogleAuth().login();
        case LoginPlatform.kakao:
          result = await KakaoAuth().login();
      }
      _userDataSource.createUser(user: result!);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
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
    await auth.FirebaseAuth.instance.signOut();
    return result;
  }
}
