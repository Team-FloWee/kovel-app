import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> login({required LoginPlatform platform});
  Future<bool> logout({required LoginPlatform platform});
}
