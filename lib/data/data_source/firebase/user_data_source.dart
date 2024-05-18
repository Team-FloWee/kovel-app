import 'package:kovel_app/domain/model/user.dart';

abstract interface class UserDataSource {
  Future<void> createUser({required User user});
  Future<void> updateUserName({required String name});
  Future<void> updateLanguage(String lang);
  Future<void> updatePhoto();
  Future<User> getUser();
  Future<void> signOut();
  Future<bool> existUser({required String id});
  Future<void> updateArchivedList({required User user, required String data});
}
