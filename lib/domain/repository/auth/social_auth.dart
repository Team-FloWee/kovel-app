import 'package:kovel_app/domain/model/user.dart';

abstract interface class SocialAuth {
  Future<User?> login();
  Future<void> logout();
}