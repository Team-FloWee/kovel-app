import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kovel_app/domain/repository/auth/social_auth.dart';

class KakaoAuth implements SocialAuth {
  @override
  Future<bool> login() async {
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        return true;
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        if (error is PlatformException && error.code == 'CANCELED') {
          return false;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (error) {
          return false;
        }
      }
      // 카카오톡이 설치안되어 있음
      // 카카오톡 계정으로 로그인
    } else {
      try {
        var provider = OAuthProvider("oidc.kovel");
        // kakao 계정으로 token 생성
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        // 생성된 토큰으로 firebase credential 생성
        var credential = provider.credential(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );
        // firebase 로그인
        FirebaseAuth.instance.signInWithCredential(credential);
        return true;
      } catch (error) {
        return false;
      }
    }
  }

  @override
  Future<bool> logout() async {
    try {
      UserApi user = UserApi.instance;
      await user.logout();
      return false;
    } catch (error) {
      return true;
    }
  }
}

