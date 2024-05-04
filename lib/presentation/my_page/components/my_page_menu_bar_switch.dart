import 'package:flutter/material.dart';

import '../../../config/ui_config.dart';
import 'my_page_switch_button.dart';

class MyPageMenuBarSwitch extends StatelessWidget {
  final String menuBarName;
  final Widget menuBarWidget;

  const MyPageMenuBarSwitch({
    super.key,
    required this.menuBarName,
    required this.menuBarWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                child: MyPageSwitchButton(
                  onToggled: (bool isToggled) {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
