import 'package:kovel_app/domain/model/user.dart';

abstract interface class UserDataSource {
  Future<void> createUser({required User user});
  Future<void> signOut();
  Future<User> getUser({required String userId});
  Future<bool> existUser({required String userId});
  Future<void> updateUserName({required String userId, required String name});
  Future<void> updateLanguage({required String lang, required String userId});
  Future<void> updateArchivedList(
      {required String userId, required String data});
  Future<void> updatePhoto({required String userId});
}
