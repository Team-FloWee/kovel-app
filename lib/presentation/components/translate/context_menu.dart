import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ContextMenu extends StatelessWidget {
  final Widget child;
  final String text;
  const ContextMenu({super.key, required this.child, required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu.builder(
        actions: [
          CupertinoContextMenuAction(
            onPressed: (){
              Clipboard.setData(ClipboardData(text: text));
              context.pop();
            },
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
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                      padding: padding,
                      child: child
                  )
              )
          );
        }
    );
  }
}
