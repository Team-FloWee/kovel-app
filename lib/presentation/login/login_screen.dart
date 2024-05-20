import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/enum/login_platform.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 1.sh
          ),
          child: Stack(
            children: [
              Center(
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
                            '로그인'.tr(),
                            style: UiConfig.h1Style.copyWith(
                              fontWeight: UiConfig.semiBoldFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      '로그인하여 다양한 여행정보를\n 탐색해 보세요'.tr(),
                      textAlign: TextAlign.center,
                      style: UiConfig.h4Style
                          .copyWith(color: UiConfig.black.shade700),
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
                          await userProvider.fetchUser();
                          if (viewModel.user == null) return;
                          if (viewModel.isNewUser) {
                            if (context.mounted)
                              context.go('/signUp', extra: viewModel.user);
                          } else {
                            if (context.mounted) context.go('/');
                          }
                        },
                        // TODO: 유저 language에 따라 다른 asset 이미지 보여지게 수정
                        child: Image.asset(
                          'assets/images/kakao_login_icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      elevation: 2,
                      child: InkWell(
                        onTap: () async {
                          await viewModel.login(platform: LoginPlatform.google);
                          await userProvider.fetchUser();
                          if (viewModel.user == null) return;
                          if (viewModel.isNewUser) {
                            if (context.mounted)
                              context.go('/signUp', extra: viewModel.user);
                          } else {
                            if (context.mounted) context.go('/');
                          }
                        },
                        // TODO: 유저 language에 따라 다른 asset 이미지 보여지게 수정
                        child: Image.asset(
                          'assets/images/google_login_icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              viewModel.isLoading ? Container(
                color: UiConfig.black.shade900.withOpacity(0.5),
                child: const Center(
                    child: SpinKitFadingCircle(
                      color: UiConfig.primaryColor,
                    )
                ),
              ) : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
