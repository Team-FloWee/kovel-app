import 'package:flutter/material.dart';
import '../../../config/ui_config.dart';

class MyPageSwitchButton extends StatefulWidget {
  final void Function(bool isToggled) onToggled;

  const MyPageSwitchButton({super.key, required this.onToggled});

  @override
  State<MyPageSwitchButton> createState() => _MyPageSwitchButtonState();
}

class _MyPageSwitchButtonState extends State<MyPageSwitchButton> {
  bool isToggled = false;
  double size = 20.0;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 1.8,

        padding: EdgeInsets.all(innerPadding),
        alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,

        // background Right : left
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isToggled ? UiConfig.primaryColor : UiConfig.black.shade600,
        ),

        // button Right : left
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:
                isToggled ? UiConfig.black.shade100 : UiConfig.black.shade100,
          ),
        ),
      ),
    );
  }
}
