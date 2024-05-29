import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';

class BottomNaviBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNaviBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top:
                BorderSide(color: UiConfig.black.shade200, width: 0.5)), // 라인효과
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedIndex,
        elevation: 0,
        onTap: (value) {
          switch (value) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/postList');
              break;
            case 2:
              context.go('/archived');
              break;
            case 3:
              context.go('/mypage');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: '홈'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.post_add),
            label: '게시판'
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),

            label: '보관함'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_circle,
            ),
            label: '마이페이지'.tr(),
          ),
        ],
      ),
    );
  }
}
