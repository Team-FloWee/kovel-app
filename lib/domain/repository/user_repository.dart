import 'package:kovel_app/core/enum/login_platform.dart';

abstract interface class UserRepository {
  Future<bool> login({required LoginPlatform platform});
  Future<bool> logout({required LoginPlatform platform});
}
