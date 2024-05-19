import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/sign_up/sign_up_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  final User user;

  const SignUpScreen({super.key, required this.user});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.user.name;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: const CommonAppBar(title: ''),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 36.h),
                    Text('회원가입'.tr(),
                        style: UiConfig.h1Style.copyWith(
                            fontWeight: UiConfig.semiBoldFont,
                            color: UiConfig.black.shade800)),
                    SizedBox(height: 16.h),
                    Text(
                      '닉네임을 입력해 주세요'.tr(),
                      style: UiConfig.h4Style
                          .copyWith(color: UiConfig.black.shade700),
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('닉네임'.tr(),
                              style: UiConfig.bodyStyle
                                  .copyWith(fontWeight: UiConfig.semiBoldFont)),
                          SizedBox(height: 6.h),
                          SizedBox(
                            child: TextField(
                              controller: _textEditingController,
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              style: UiConfig.bodyStyle,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: '빨간망토'.tr(),
                                  hintStyle: UiConfig.bodyStyle
                                      .copyWith(color: UiConfig.black.shade700),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UiConfig.black.shade200),
                                      borderRadius: BorderRadius.circular(8)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UiConfig.black.shade200),
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 32.w,
                          height: 56.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          UiConfig.primaryColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)))),
                              onPressed: () async {
                                await viewModel.clickSignUpButton(
                                    user: userProvider.user,
                                    userId: userProvider.user.userId,
                                    name: _textEditingController.text);
                                context.go('/');
                              },
                              child: Text(
                                '가입 완료'.tr(),
                                style: UiConfig.bodyStyle.copyWith(
                                    color: UiConfig.black.shade100,
                                    fontWeight: UiConfig.semiBoldFont),
                              )),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('계속 진행함으로써 귀하는 당사의'.tr(),
                              style: UiConfig.extraSmallStyle
                                  .copyWith(color: UiConfig.black.shade800)),
                          Text(' 서비스 약관 '.tr(),
                              style: UiConfig.extraSmallStyle
                                  .copyWith(color: UiConfig.primaryColor)),
                          Text('및'.tr(),
                              style: UiConfig.extraSmallStyle
                                  .copyWith(color: UiConfig.black.shade800)),
                          Text(' 개인정보 보호정책'.tr(),
                              style: UiConfig.extraSmallStyle
                                  .copyWith(color: UiConfig.primaryColor)),
                          Text('에',
                              style: UiConfig.extraSmallStyle
                                  .copyWith(color: UiConfig.black.shade800))
                        ],
                      ),
                      Row(
                        children: [
                          Text('동의하는 것으로 간주됩니다.'.tr(),
                              style: UiConfig.extraSmallStyle
                                  .copyWith(color: UiConfig.black.shade800)),
                        ],
                      ),
                      SizedBox(height: 46.h)
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
