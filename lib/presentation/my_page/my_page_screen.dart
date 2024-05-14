import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/my_page/my_page_view_model.dart';
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
    Future.microtask(() => context.read<MyPageViewModel>().getProfile());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const CommonAppBar(title: ''),
      body: SafeArea(
        child: SingleChildScrollView(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: MyPageUserProfile(
                  userName: viewModel.user.name,
                  userEmail: viewModel.user.email,
                  userProfilePath: viewModel.user.imageUrl,
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
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
