import 'package:flutter/material.dart';
import 'package:kovel_app/core/enums/content_type.dart';
import 'package:kovel_app/presentation/components/category_item.dart';

class CategoryList extends StatefulWidget {
  final List<ContentType> textdata;

  const CategoryList({required this.textdata, Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();
    isSelectedList = List.filled(widget.textdata.length, false);
    isSelectedList[0] = true; // 첫 번째 아이템을 기본으로 선택
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: List.generate(
            widget.textdata.length,
                (index) => CategoryItem(
              text: widget.textdata[index].text,
              isSelected: isSelectedList[index],
              onSelect: (bool isSelected) {
                setState(() {
                  isSelectedList = List.filled(widget.textdata.length, false);
                  isSelectedList[index] = isSelected;
                });
              },
              key: Key(widget.textdata[index].text),
            ),
          ),
        ),
      ),
    );
  }
}
