import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatelessWidget {
  final Widget child;
  const ContextMenu({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu.builder(
        actions: [
          CupertinoContextMenuAction(
            onPressed: (){},
            child: Text('Copy'),
            trailingIcon: Icons.copy,
          ),
          CupertinoContextMenuAction(
              onPressed: (){},
              child: Text('Translate'),
              trailingIcon: Icons.translate
          )
        ],
        enableHapticFeedback: true,
        builder: (context, animation) {
          EdgeInsetsGeometry padding;
          if (animation.value > 0.7) {
            padding = EdgeInsets.all(16.0);
          } else {
            padding = EdgeInsets.zero;
          }
          return Container(
              padding: padding,
              width: MediaQuery.of(context).size.width,
              child: Material(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90)
                      ),
                      padding: padding,
                      child: child)
              )
          );
        }
    );
  }
}
