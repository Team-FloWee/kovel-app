import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: UiConfig.black.shade200, width: 0.5)), // 라인효과
      ),
      child: BottomNavigationBar(
        elevation: 0,
        onTap: (value) {
          switch (value) {
            case 0:
            // context.go('/');
            case 1:
            // context.go('/bookmarks');
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: UiConfig.primaryColor,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: UiConfig.black.shade700,
              ),
              label: '보관함'),
          const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '마이페이지'),
        ],
        selectedLabelStyle: const TextStyle(
          fontWeight: UiConfig.semiBoldFont,
        ),
        selectedItemColor: UiConfig.primaryColor,
        unselectedLabelStyle: const TextStyle(fontWeight: UiConfig.semiBoldFont),
      ),
    );
  }
}
