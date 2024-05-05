import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/content_title.dart';

import '../../config/ui_config.dart';
import '../components/common_app_bar.dart';
import 'components/my_page_menu_list.dart';
import 'components/my_page_user_profile.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: ''),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: ContentTitle(
                title: '내 프로필',
                // withMore: true,
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: MyPageUserProfile(
                userName: '김코블',
                userEmail: 'kovel@trip.com',
                userProfilePath:
                    // 'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833552.jpg?w=1060&t=st=1714144594~exp=1714145194~hmac=af74a04de4f0eba5788d15dc2579b9a75a9ced94d03fba12091bfbf47c3d9b60',
                    '',
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Divider(height: 1, color: UiConfig.black.shade500),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: MyPageMenuList(),
            ),
          ],
        ),
      ),
    );
  }
}
