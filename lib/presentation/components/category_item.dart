import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class CategoryItem extends StatelessWidget {
  final String text;

  const CategoryItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: UiConfig.black.shade500,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            text,
            style: UiConfig.smallStyle.copyWith(
              fontWeight: UiConfig.semiBoldFont,
              color: UiConfig.black.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
