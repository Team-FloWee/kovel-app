import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/category/category.dart';

class CategoryItem extends StatelessWidget {
  final Category item;

  const CategoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: UiConfig.black.shade500,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              item.name,
              style: UiConfig.smallStyle.copyWith(
                fontWeight: UiConfig.semiBoldFont,
                color: UiConfig.black.shade900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
