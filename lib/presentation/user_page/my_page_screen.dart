import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/user_page/components/my_page_menu_list.dart';
import 'package:kovel_app/presentation/user_page/components/my_page_your_profile.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('마이페이지',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyPageYourProfile(),
          MyPageMenuList(),
        ],
      ),
    );
  }
}
