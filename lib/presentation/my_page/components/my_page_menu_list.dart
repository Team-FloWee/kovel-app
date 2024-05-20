import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/presentation/my_page/components/language_edit_dialog.dart';
import 'package:kovel_app/presentation/my_page/components/my_page_menu_bar_widget.dart';
import 'package:kovel_app/presentation/my_page/components/my_page_switch_button.dart';
import 'package:kovel_app/presentation/my_page/my_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    Future.microtask(() => context.read<UserProvider>().fetchUser());
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
            userProvider.fetchUser();
          },
        ),
        /*
        MyPageMenuBar(
          menuBarName: '공지사항'.tr(),
          menuBarIcon: Icons.notifications_outlined,
        ),
        MyPageMenuBar(
          menuBarName: 'FAQ'.tr(),
          menuBarIcon: Icons.chat_bubble_outline_outlined,
        ),
         */
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
                viewModel.updateLanguage(
                    lang: lang, userId: userProvider.user.userId);
              }),
            );
          },
        ),
        /*
        MyPageMenuBarWidget(
          menuBarName: '다크 모드'.tr(),
          menuBarWidget: const MyPageSwitchButton(),
        ),
         */
        MyPageMenuBar(
          menuBarName: '이용약관'.tr(),
          menuBarIcon: Icons.help_outline,
          onTapMenuBar: () {
            if (userProvider.user.language == 'en') {
              _launchUrl(Uri.parse('https://rigorous-tango-e92.notion.site/Terms-Conditions-6d1bc326516a426981b235a9b896bd77?pvs=4'));
            } else {
              _launchUrl(Uri.parse('https://rigorous-tango-e92.notion.site/d8ea4024033b4e9cb5b76a5a302619f7?pvs=4'));
            }
          },
        ),
        MyPageMenuBar(
          menuBarName: '개인정보처리방침'.tr(),
          menuBarIcon: Icons.text_snippet,
          onTapMenuBar: () {
            if (userProvider.user.language == 'en') {
              _launchUrl(Uri.parse('https://rigorous-tango-e92.notion.site/Privacy-Policy-dad474931f2d438099f7d4f6c12e9f63?pvs=4'));
            } else {
              _launchUrl(Uri.parse('https://rigorous-tango-e92.notion.site/e3f09af7507c4284b0c9716ba9854112?pvs=4'));
            }
          },
        ),
        MyPageMenuBar(
          menuBarName: '라이센스'.tr(),
          menuBarIcon: Icons.info,
          onTapMenuBar: () => context.push('/license')
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
  
  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}
