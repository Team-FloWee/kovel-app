import 'package:flutter/material.dart';

import '../../../config/ui_config.dart';

class ChatCategoryItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function()? onSelect;

  ChatCategoryItem({
    required this.text,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          onSelect?.call();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: isSelected ? UiConfig.primaryColor : UiConfig.black.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                text,
                style: UiConfig.bodyStyle.copyWith(
                  fontWeight: UiConfig.regularFont,
                  color: isSelected ? UiConfig.black.shade100 : UiConfig.black.shade800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}