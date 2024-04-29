import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem('전체'),
          CategoryItem('가족코스'),
          CategoryItem('나홀로코스'),
          CategoryItem('힐링'),
          CategoryItem('도보코스'),
          CategoryItem('캠핑'),
          CategoryItem('맛'),
          CategoryItem('가족코스'),
          CategoryItem('가족코스'),
        ],
      ),
    );
  }
}
