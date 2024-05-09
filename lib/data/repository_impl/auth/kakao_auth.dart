import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:kovel_app/domain/repository/auth/social_auth.dart';
import 'package:kovel_app/domain/model/user.dart';

class KakaoAuth implements SocialAuth {
  @override
  Future<User?> login() async {
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        kakao.OAuthToken token = await kakao.UserApi.instance.loginWithKakaoTalk();

        var credential = auth.OAuthProvider("oidc.kovel").credential(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );

        // firebase 로그인
        final userCredential = await auth.FirebaseAuth.instance.signInWithCredential(credential);

        final kakaoUser = await kakao.UserApi.instance.me();

        final user = User(
            userId: userCredential.user!.uid,
            name: kakaoUser.kakaoAccount?.profile?.nickname ?? '',
            email: kakaoUser.kakaoAccount?.email ?? '',
            imageUrl: kakaoUser.kakaoAccount?.profile?.profileImageUrl ?? ''
        );
        return user;
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          kakao.OAuthToken token = await kakao.UserApi.instance.loginWithKakaoAccount();
          var credential = auth.OAuthProvider("oidc.kovel").credential(
            idToken: token.idToken,
            accessToken: token.accessToken,
          );

          // firebase 로그인
          final userCredential = await auth.FirebaseAuth.instance.signInWithCredential(credential);

          final kakaoUser = await kakao.UserApi.instance.me();

          final user = User(
              userId: userCredential.user!.uid,
              name: kakaoUser.kakaoAccount?.profile?.nickname ?? '',
              email: kakaoUser.kakaoAccount?.email ?? '',
              imageUrl: kakaoUser.kakaoAccount?.profile?.profileImageUrl ?? ''
          );
          return user;
        } catch (error) {
          return null;
        }
      }
      // 카카오톡이 설치안되어 있음
      // 카카오톡 계정으로 로그인
    } else {
      try {
        // kakao 계정으로 token 생성
        kakao.OAuthToken token = await kakao.UserApi.instance.loginWithKakaoAccount();
        // 생성된 토큰으로 firebase credential 생성
        var credential = auth.OAuthProvider("oidc.kovel").credential(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );
        // firebase 로그인
        final userCredential = await auth.FirebaseAuth.instance.signInWithCredential(credential);

        final kakaoUser = await kakao.UserApi.instance.me();

        final user = User(
            userId: userCredential.user!.uid,
            name: kakaoUser.kakaoAccount?.profile?.nickname ?? '',
            email: kakaoUser.kakaoAccount?.email ?? '',
            imageUrl: kakaoUser.kakaoAccount?.profile?.profileImageUrl ?? ''
        );
        return user;
      } catch (error) {
        return null;
      }
    }
  }

  @override
  Future<void> logout() async {
    try {
      kakao.UserApi user = kakao.UserApi.instance;
      await user.logout();
    } catch (error) {
      print(error);
    }
  }
}

