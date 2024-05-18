import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> login({required LoginPlatform platform});
  Future<bool> logout({required LoginPlatform platform});

  Future<User> getUser();
  Future<bool> updateUserName({required String name});
  Future<void> updatePhoto();
  Future<void> signOut();
  Future<void> updateLanguage(String lang);
  Future<bool> existUser({required String id});
  Future<bool> createUser({required User user});
  Future<void> saveArchivedList({required User user, required String data});
  Future<void> deleteArchivedList({required User user, required String data});
}
