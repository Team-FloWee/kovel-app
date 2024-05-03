import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kovel_app/presentation/login/firebase_auth_remote_date_source.dart';
import 'package:kovel_app/presentation/login/social_login.dart';

class LoginViewModel with ChangeNotifier {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  LoginViewModel({required SocialLogin socialLogin}) : _socialLogin = socialLogin;

  Future login() async {
    isLogined = await _socialLogin.login();
    print('isLogined: $isLogined');
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      // final token = await _firebaseAuthDataSource.createCustomToken({
      //   'uid': user!.id.toString(),
      //   // 'displayName': user!.kakaoAccount!.profile!.nickname,
      //   // 'email': user!.kakaoAccount!.email,
      //   // 'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,
      // });
      // print(token);
      // final userCredential = await FirebaseAuth.instance.signInWithCustomToken(token);
      // final kakaoUser = userCredential.user;
      // final idToken = await kakaoUser!.getIdToken();

      // await FirebaseAuth.instance.signInWithCustomToken(token);
      var provider = Auth.OAuthProvider("oidc.kovel");
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('token: $token');
      var credential = provider.credential(
        accessToken: token.accessToken,
        idToken: token.idToken,
      );
      await Auth.FirebaseAuth.instance.signInWithCredential(credential);

      print('firebase sign in 완료');
    }

    notifyListeners();
  }

  Future logout() async {
    await _socialLogin.logout();
    await FirebaseAuth.instance.signOut();
    isLogined = false;
    user = null;
    notifyListeners();
  }
}
