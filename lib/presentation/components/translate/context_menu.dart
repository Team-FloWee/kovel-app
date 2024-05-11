import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/data/data_source/ai_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/ai_repository_impl.dart';

class ContextMenu extends StatefulWidget {
  final Widget child;
  final String text;
  const ContextMenu({super.key, required this.child, required this.text});

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu.builder(
        actions: [
          CupertinoContextMenuAction(
            onPressed: (){
              Clipboard.setData(ClipboardData(text: widget.text));
              context.pop();
            },
            child: Text('Copy'),
            trailingIcon: Icons.copy,
          ),
          CupertinoContextMenuAction(
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context){
                    return SizedBox(
                      height: 400,
                      child: Center(
                        child: FutureBuilder(
                          future: AiRepositoryImpl(aiDataSource: AiDataSourceImpl()).getTranslation(request: widget.text, language: 'english'),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? '');
                          },
                        ),
                      ),
                    );
                  },
                );

              },
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
                      child: widget.child
                  )
              )
          );
        }
    );
  }
}
