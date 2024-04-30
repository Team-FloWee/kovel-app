import 'package:flutter/material.dart';

class Top10PopularLandmarks extends StatelessWidget {
  final String text;

  const Top10PopularLandmarks({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),

      height: 200, // 내용의 높이
      width: 200,
      child: Center(child: Text(text)), // 데이터 1
    );
  }
}
