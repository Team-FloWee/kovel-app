import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/presentation/components/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categoryData;
  const CategoryList({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: categoryData.map((e) => CategoryItem(item: e)).toList(),
        ),
      ),
    );
  }
}
