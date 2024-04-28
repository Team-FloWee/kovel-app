import 'package:flutter/material.dart';

class MyPageMenuBar extends StatelessWidget {
  final String menuBarName;
  final IconData menuIcon;

  const MyPageMenuBar({
    super.key,
    required this.menuBarName,
    required this.menuIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
      width: MediaQuery.of(context).size.width,
      height: 72.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(menuBarName),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Icon(menuIcon),
          ),
        ],
      ),
    );
  }
}
