import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class UserChatWidget extends StatelessWidget {
  final String text;
  const UserChatWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              color: UiConfig.primaryColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
              text,
              style: UiConfig.h4Style.copyWith(color: UiConfig.black.shade100)
          ),
        ),
      ),
    );
  }
}
