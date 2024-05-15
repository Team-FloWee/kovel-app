import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class ModelChatWidget extends StatelessWidget {
  final String text;
  const ModelChatWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: UiConfig.black.shade100,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(text) ,
      ),
    );
  }
}
