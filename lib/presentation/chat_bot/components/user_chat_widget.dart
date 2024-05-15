import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class UserChatWidget extends StatelessWidget {
  final String text;
  const UserChatWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: UiConfig.primaryColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Text(text) ,
      ),
    );
  }
}
