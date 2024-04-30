import 'package:flutter/material.dart';

class OngoingFestivals extends StatelessWidget {
  final String text;
  const OngoingFestivals({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        height: 200, // 내용의 높이
        width: 200,
        child: Center(child: Text(text)), // 데이터 1
      ),
    );
  }
}
