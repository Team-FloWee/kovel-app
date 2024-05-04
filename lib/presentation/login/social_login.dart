abstract interface class SocialLogin {
  Future<bool> login();

  Future<bool> logout();
}
