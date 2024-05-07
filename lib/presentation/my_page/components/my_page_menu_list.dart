import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/my_page/components/logout_dialog.dart';
import 'package:kovel_app/presentation/my_page/components/my_page_menu_bar_widget.dart';
import 'package:kovel_app/presentation/my_page/components/my_page_switch_button.dart';

import 'my_page_menu_bar.dart';

class MyPageMenuList extends StatelessWidget {
  const MyPageMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyPageMenuBar(
          menuBarName: '계정 설정',
          menuBarIcon: Icons.account_circle_outlined,
        ),
        const MyPageMenuBar(
          menuBarName: '공지사항',
          menuBarIcon: Icons.notifications_outlined,
        ),
        const MyPageMenuBar(
          menuBarName: 'FAQ',
          menuBarIcon: Icons.chat_bubble_outline_outlined,
        ),
        const MyPageMenuBar(
          menuBarName: '언어',
          menuBarIcon: Icons.language_outlined,
        ),
        MyPageMenuBarWidget(
          menuBarName: 'Dark Mode',
          menuBarWidget: MyPageSwitchButton(),
        ),
        // MyPageMenuBar(
        //   menuBarName: '로그아웃',
        //   menuBarIcon: Icons.logout_outlined,
        //   menuBarWidget: LogoutDialog(),
        // ),
        // TODO: 로그아웃 바 전체로
        const MyPageMenuBarWidget(
          menuBarName: '로그아웃',
          menuBarWidget: LogoutDialog(),
        ),
      ],
    );
  }
}
