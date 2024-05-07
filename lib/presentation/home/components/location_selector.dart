import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/category/category.dart';

class LocationSelector extends StatelessWidget {
  final Category category;
  final void Function(Category category)? onSelect;

  const LocationSelector({
    super.key,
    required this.onSelect,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect?.call(category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: UiConfig.black.shade500,
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          category.name,
          style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
