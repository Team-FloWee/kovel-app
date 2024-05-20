import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/category_item.dart';

import '../../domain/model/category/category.dart';

class CategoryList extends StatefulWidget {
  final List<Category> categoryData;
  final void Function(Category category)? onSelect;


  const CategoryList({super.key, required this.categoryData, required this.onSelect});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: List.generate(
            widget.categoryData.length,
                (index) => CategoryItem(
              category: widget.categoryData[index],
              isSelected: _selectedIndex == index ,
              onSelect: (Category selectedCategory) {
                setState(() {
                  _selectedIndex = widget.categoryData.indexOf(selectedCategory);
                  widget.onSelect?.call(selectedCategory);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}