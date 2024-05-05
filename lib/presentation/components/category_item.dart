import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final void Function(Category selectedCategory)? onSelect;

  CategoryItem({
    required this.category,
    required this.isSelected,
    required this.onSelect,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          onSelect?.call(category);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: isSelected ? UiConfig.primaryColor : UiConfig.black.shade500,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                category.name,
                style: UiConfig.smallStyle.copyWith(
                  fontWeight: UiConfig.semiBoldFont,
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