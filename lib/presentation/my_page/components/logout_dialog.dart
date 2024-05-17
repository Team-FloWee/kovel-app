import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/ui_config.dart';

class LogoutDialog extends StatelessWidget {
  final Function() logout;
  const LogoutDialog({super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: UiConfig.black.shade100,
      surfaceTintColor: UiConfig.black.shade100,
      icon: const Icon(Icons.error, color: UiConfig.primaryColor),
      title: Text(
        '로그아웃',
        style: UiConfig.h3Style.copyWith(fontWeight: UiConfig.semiBoldFont),
      ),
      content: Text(
        '로그아웃 하시겠어요?',
        textAlign: TextAlign.center,
        style: UiConfig.h4Style,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context, '취소'),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: UiConfig.black.shade600,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '취소',
                    style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                context.pop();
                logout();
                context.go('/login');
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: UiConfig.primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '로그아웃',
                    style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
