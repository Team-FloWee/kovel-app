import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';

class BottomNaviBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNaviBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _BottomNaviBarState createState() => _BottomNaviBarState();
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
        currentIndex: widget.selectedIndex,
        elevation: 0,
        onTap: (value) {
          switch (value) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/archived');
              break;
            case 2:
              context.go('/mypage');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            label: '보관함',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
