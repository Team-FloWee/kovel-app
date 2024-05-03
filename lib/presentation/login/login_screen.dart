import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kovel_app/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return Scaffold(
      body: Center(
          child: viewModel.isLogined
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        viewModel.logout();
                      },
                      child: Card(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          elevation: 2,
                          child: const Text('로그아웃')
                          // Image.asset(
                          //   'assets/images/kakao_login_medium_wide.png',
                          //   fit: BoxFit.cover,
                          // ),
                          ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        viewModel.login();
                      },
                      child: Card(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        elevation: 2,
                        child: Image.asset(
                          'assets/images/kakao_login_medium_wide.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        signInWithGoogle();
                      },
                      child: Card(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        elevation: 2,
                        child: Image.asset(
                          'assets/images/Google Login.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                    )
                  ],
                )),
    );
  }
}

Future<void> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
    debugPrint('####email : ${value.user?.email}');
  }).onError((error, stackTrace) {
    debugPrint('error : $error');
  });
}
