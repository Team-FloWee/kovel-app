import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:provider/provider.dart';

import '../../config/ui_config.dart';
import '../components/bottom_navi_bar.dart';
import 'components/my_page_menu_list.dart';
import 'components/my_page_user_profile.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const CommonAppBar(title: ''),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ContentTitle(
                  title: '내 프로필'.tr(),
                  // withMore: true,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MyPageUserProfile(
                  userName: userProvider.user.name,
                  userEmail: userProvider.user.email,
                  userProfilePath: userProvider.user.imageUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Divider(height: 1, color: UiConfig.black.shade500),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: MyPageMenuList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 2),
    );
  }
}
