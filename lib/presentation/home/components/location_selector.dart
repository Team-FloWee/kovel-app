import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/category/category.dart';

class LocationSelector extends StatefulWidget {
  // final List<Category> categoryData;
  // final void Function(Category category)? onSelect;

  // const LocationSelector({super.key, required this.categoryData, required this.onSelect});
  const LocationSelector({super.key});

  @override
  State<LocationSelector> createState() => _LocationSelectorListState();
}

class _LocationSelectorListState extends State<LocationSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: UiConfig.black.shade500,
      ),
      padding: const EdgeInsets.all(8),
    );
  }
}
