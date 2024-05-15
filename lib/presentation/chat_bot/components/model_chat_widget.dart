import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class ModelChatWidget extends StatelessWidget {
  final String text;
  const ModelChatWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: UiConfig.black.shade100,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text(text, style: UiConfig.h4Style),
        ),
      ),
    );
  }
}
