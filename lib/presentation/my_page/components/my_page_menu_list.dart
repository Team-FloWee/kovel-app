import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/presentation/my_page/components/language_edit_dialog.dart';
import 'package:kovel_app/presentation/my_page/components/my_page_menu_bar_widget.dart';
import 'package:kovel_app/presentation/my_page/components/my_page_switch_button.dart';
import 'package:kovel_app/presentation/my_page/my_page_view_model.dart';
import 'package:provider/provider.dart';

import 'logout_dialog.dart';
import 'my_page_menu_bar.dart';

class MyPageMenuList extends StatefulWidget {
  const MyPageMenuList({super.key});

  @override
  State<MyPageMenuList> createState() => _MyPageMenuListState();
}

class _MyPageMenuListState extends State<MyPageMenuList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserProvider>().getUser());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Column(
      children: [
        MyPageMenuBar(
          menuBarName: '계정 설정'.tr(),
          menuBarIcon: Icons.account_circle_outlined,
          onTapMenuBar: () async {
            await context.push('/mypageedit');
            userProvider.getUser();
          },
        ),
        MyPageMenuBar(
          menuBarName: '공지사항'.tr(),
          menuBarIcon: Icons.notifications_outlined,
        ),
        MyPageMenuBar(
          menuBarName: 'FAQ'.tr(),
          menuBarIcon: Icons.chat_bubble_outline_outlined,
        ),
        MyPageMenuBar(
          menuBarName: '언어'.tr(),
          menuBarIcon: Icons.language_outlined,
          onTapMenuBar: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  LanguageEditDialog(updateLanguage: (String lang) async {
                if (lang == 'en') {
                  await context.setLocale(const Locale('en', 'US'));
                } else {
                  await context.setLocale(const Locale('ko', 'KR'));
                }
                viewModel.updateLanguage(lang);
              }),
            );
          },
        ),
        MyPageMenuBarWidget(
          menuBarName: '다크 모드'.tr(),
          menuBarWidget: const MyPageSwitchButton(),
        ),
        MyPageMenuBar(
          menuBarName: '로그아웃'.tr(),
          menuBarIcon: Icons.logout_outlined,
          onTapMenuBar: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => LogoutDialog(logout: () {
                viewModel.logout();
              }),
            );
          },
          // menuBarWidget: LogoutDialog(),
        ),
      ],
    );
  }
}
