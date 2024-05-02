import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class CategoryItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function(bool) onSelect;

  const CategoryItem({
    required this.text,
    required this.isSelected,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          widget.onSelect(!widget.isSelected);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: widget.isSelected ? UiConfig.primaryColor : UiConfig.black.shade500,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                widget.text,
                style: UiConfig.smallStyle.copyWith(
                  fontWeight: UiConfig.semiBoldFont,
                  color: widget.isSelected ? UiConfig.black.shade100 : UiConfig.black.shade800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
