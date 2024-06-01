import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> login({required LoginPlatform platform});
  Future<bool> logout({required LoginPlatform platform});
  Future<void> signOut();

  Future<bool> createUser({required User user});
  Future<bool> existUser({required String userId});
  Future<User> getUser({required String userId});
  Future<bool> updateUserName({required String userId, required String name});
  Future<void> updatePhoto({required String userId});
  Future<void> updateLanguage({required String lang, required String userId});
  Future<void> updateArchivedList(
      {required String userId, required List<Archived> archivedList});
}
