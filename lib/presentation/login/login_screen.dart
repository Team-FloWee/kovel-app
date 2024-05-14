import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Stack(
              children: [
                Image.asset('assets/images/login_background.png'),
                Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.09,
                    left: MediaQuery.of(context).size.width * 0.4,
                    child: Image.asset('assets/images/app_icon.png')),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    '로그인',
                    style: UiConfig.h1Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              '로그인하여 다양한 여행정보를\n 탐색해 보세요',
              textAlign: TextAlign.center,
              style: UiConfig.h4Style.copyWith(color: UiConfig.black.shade700),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Card(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              elevation: 2,
              child: InkWell(
                onTap: () async {
                  await viewModel.login(platform: LoginPlatform.kakao);
                  if (viewModel.user == null) return;
                  if (viewModel.isNewUser) {
                    context.go('/signUp', extra: viewModel.user);
                  } else {
                    context.go('/');
                  }
                },
                child: Image.asset(
                  'assets/images/kakao_login_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Card(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              elevation: 2,
              child: InkWell(
                onTap: () async {
                  await viewModel.login(platform: LoginPlatform.google);
                  if (viewModel.user == null) return;
                  if (viewModel.isNewUser) {
                    context.go('/signUp', extra: viewModel.user);
                  } else {
                    context.go('/locationList');
                  }
                },
                child: Image.asset(
                  'assets/images/google_login_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
