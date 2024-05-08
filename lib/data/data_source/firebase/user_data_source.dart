import 'package:kovel_app/domain/model/user.dart';

abstract interface class UserDataSource {
  Future<void> createUser({required User user});
}