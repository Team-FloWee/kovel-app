abstract interface class SocialAuth {
  Future<bool> login();
  Future<bool> logout();
}