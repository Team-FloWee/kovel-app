import 'package:flutter/cupertino.dart';
import '../../../config/ui_config.dart';

class MyPageSwitchButton extends StatefulWidget {
  const MyPageSwitchButton({super.key});

  @override
  State<MyPageSwitchButton> createState() => _MyPageSwitchButtonState();
}

class _MyPageSwitchButtonState extends State<MyPageSwitchButton> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Transform.translate(
        offset: const Offset(10, 0),
        child: CupertinoSwitch(
          value: switchValue,
          activeColor: UiConfig.primaryColor,
          onChanged: (bool? value) {
            setState(
              () {
                switchValue = value ?? false;
              },
            );
          },
        ),
      ),
    );
  }
}
