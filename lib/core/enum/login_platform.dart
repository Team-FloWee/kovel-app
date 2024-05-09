enum LoginPlatform {
  google('google', 0),
  kakao('kakao', 1);

  const LoginPlatform(this.platform, this.platformIndex);
  final String platform;
  final int platformIndex;
}
