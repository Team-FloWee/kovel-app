import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class MyPageMenuBar extends StatelessWidget {
  final String menuBarName;
  final IconData menuBarIcon;

  const MyPageMenuBar({
    super.key,
    required this.menuBarName,
    required this.menuBarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          splashColor: UiConfig.primaryColor.withOpacity(0.05),
          highlightColor: UiConfig.primaryColor.withOpacity(0.1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 64.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: UiConfig.black.shade600,
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(menuBarName, style: UiConfig.bodyStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(menuBarIcon,
                      size: 18, color: UiConfig.black.shade800),
                  // menuBarWidget,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
