import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/presentation/archived/components/archived_item.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:provider/provider.dart';

import '../../config/ui_config.dart';
import '../../domain/model/archived.dart';

class ArchivedScreen extends StatefulWidget {
  const ArchivedScreen({super.key});

  @override
  State<ArchivedScreen> createState() => _ArchivedScreenState();
}

class _ArchivedScreenState extends State<ArchivedScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserProvider>().fetchUser());
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '나의 보관함'.tr(),
          style: UiConfig.h3Style.copyWith(
            fontWeight: UiConfig.semiBoldFont,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
          child: Align(
            alignment: Alignment.center,
            child: GridView.builder(
              itemCount: userProvider.user.archivedList.length, // 아이템 개수
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                // index에 해당하는 archived를 가져옴
                Archived archived = userProvider.user.archivedList[index];
                return ArchivedItem(
                  archived: archived,
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 3),
    );
  }
}
