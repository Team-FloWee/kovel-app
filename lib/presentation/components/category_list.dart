import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<String> textdata;
  const CategoryList({super.key, required this.textdata});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: textdata.map((e) => CategoryItem(e)).toList(),
        ),
      ),
    );
  }
}
