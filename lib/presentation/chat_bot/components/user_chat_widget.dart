import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/chat.dart';

class UserChatWidget extends StatelessWidget {
  final Chat chat;
  const UserChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              color: UiConfig.primaryColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
              chat.text,
              style: UiConfig.h4Style.copyWith(color: UiConfig.black.shade100)
          ),
        ),
      ),
    );
  }
}
