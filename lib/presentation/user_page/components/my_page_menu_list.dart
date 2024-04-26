import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/user_page/components/my_page_menu_bar.dart';

class MyPageMenuList extends StatelessWidget {
  const MyPageMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyPageMenuBar(
          menuBarName: 'Personal Information',
          menuIcon: Icons.account_circle_outlined,
        ),
        MyPageMenuBar(
          menuBarName: 'Notification',
          menuIcon: Icons.notifications_outlined,
        ),
        MyPageMenuBar(
          menuBarName: 'FAQ',
          menuIcon: Icons.chat_bubble_outline_outlined,
        ),
        MyPageMenuBar(
          menuBarName: 'Language',
          menuIcon: Icons.language_outlined,
        ),
        MyPageMenuBar(
          menuBarName: 'Logout',
          menuIcon: Icons.logout_outlined,
        ),
      ],
    );
  }
}
