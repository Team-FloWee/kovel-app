import 'package:flutter/material.dart';
import 'chat_category_item.dart';

class ChatCategoryWidget extends StatefulWidget {
  final List<String> categoryData;
  final void Function(String)? onSelect;

  const ChatCategoryWidget({
    required this.onSelect,
    required this.categoryData,
  });

  @override
  _ChatCategoryListState createState() => _ChatCategoryListState();
}

class _ChatCategoryListState extends State<ChatCategoryWidget> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,bottom: 16.0),
        child: Row(
          children: List.generate(
            widget.categoryData.length,
                (index) {
              String categoryText = widget.categoryData[index];
              return ChatCategoryItem(
                text: categoryText,
                isSelected: _selectedIndex == index,
                onSelect: () {
                  setState(() {
                    _selectedIndex = index;
                    widget.onSelect?.call(categoryText);
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}