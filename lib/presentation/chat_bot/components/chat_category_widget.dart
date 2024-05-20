import 'package:flutter/material.dart';

import 'chat_category_item.dart';

class ChatCategoryWidget extends StatefulWidget {
  final List<String> categoryData;
  final void Function(String)? onSelect;

  const ChatCategoryWidget({
    super.key,
    required this.onSelect,
    required this.categoryData,
  });

  @override
  State<ChatCategoryWidget> createState() => _ChatCategoryWidgetState();
}

class _ChatCategoryWidgetState extends State<ChatCategoryWidget> {
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
              return ChatCategoryItem(
                text: widget.categoryData[index],
                isSelected: _selectedIndex == index,
                onSelect: () {
                  if (_selectedIndex != -1) return;
                  setState(() {
                    _selectedIndex = index;
                    widget.onSelect?.call(widget.categoryData[_selectedIndex]);
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