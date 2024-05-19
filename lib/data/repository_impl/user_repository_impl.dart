import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/data/data_source/firebase/user_data_source.dart';
import 'package:kovel_app/data/repository_impl/auth/google_auth.dart';
import 'package:kovel_app/data/repository_impl/auth/kakao_auth.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  @override
  Future<User?> login({required LoginPlatform platform}) async {
    User? result;
    try {
      switch (platform) {
        case LoginPlatform.google:
          result = await GoogleAuth().login();
        case LoginPlatform.kakao:
          result = await KakaoAuth().login();
      }
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> logout({required LoginPlatform platform}) async {
    bool result = false;
    switch (platform) {
      case LoginPlatform.google:
        await GoogleAuth().logout();
      case LoginPlatform.kakao:
        await KakaoAuth().logout();
    }
    await auth.FirebaseAuth.instance.signOut();
    return result;
  }

  @override
  Future<bool> updateUser({required User user}) async {
    bool result = false;
    try {
      await _userDataSource.updateUser(user: user);
      result = true;
    } catch (error) {
      result = false;
    }
    return result;
  }

  @override
  Future<User> getUser({required String id}) async {
    User user;
    try {
      user = await _userDataSource.getUser(id: id);
    } catch (error) {
      user = const User(
        userId: '',
        name: '',
        email: '',
        imageUrl: '',
        language: 'ko',
        archivedList: [],
      );
    }
    return user;
  }

  @override
  Future<void> signOut() async {
    await _userDataSource.signOut();
  }

  @override
  Future<bool> existUser({required String id}) async {
    final result = await _userDataSource.existUser(id: id);
    return result;
  }

  @override
  Future<bool> createUser({required User user}) async {
    try {
      await _userDataSource.createUser(user: user);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> deleteArchivedList(
      {required User user, required String data}) async {
    await _userDataSource.updateArchivedList(user: user, data: data);
  }

  @override
  Future<void> saveArchivedList(
      {required User user, required String data}) async {
    await _userDataSource.updateArchivedList(user: user, data: data);
  }
}
