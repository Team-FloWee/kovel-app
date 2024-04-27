
import 'package:flutter/material.dart';

class OngoingFestivals extends StatelessWidget {
  final String text;
  const OngoingFestivals({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        height: 200, // 내용의 높이
        width: 200,
        child: Center(child: Text(text)), // 데이터 1
      ),
    );
  }
}
