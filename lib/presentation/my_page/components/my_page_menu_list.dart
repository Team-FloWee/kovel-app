import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    Future.microtask(() => context.read<MyPageViewModel>().getProfile());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    return Column(
      children: [
        MyPageMenuBar(
          menuBarName: '계정 설정',
          menuBarIcon: Icons.account_circle_outlined,
          onTapMenuBar: () async {
            await context.push('/mypageedit');
            viewModel.getProfile();
          },
        ),
        const MyPageMenuBar(
          menuBarName: '공지사항',
          menuBarIcon: Icons.notifications_outlined,
        ),
        const MyPageMenuBar(
          menuBarName: 'FAQ',
          menuBarIcon: Icons.chat_bubble_outline_outlined,
        ),
        MyPageMenuBar(
          menuBarName: '언어',
          menuBarIcon: Icons.language_outlined,
          onTapMenuBar: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  LanguageEditDialog(updateLanguage: (String lang) {
                viewModel.updateLanguage(lang);
              }),
            );
          },
        ),
        const MyPageMenuBarWidget(
          menuBarName: 'Dark Mode',
          menuBarWidget: MyPageSwitchButton(),
        ),
        MyPageMenuBar(
          menuBarName: '로그아웃',
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
