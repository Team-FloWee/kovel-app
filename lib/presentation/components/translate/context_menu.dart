import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/service/ai_provider.dart';
import 'package:kovel_app/di/di_setup.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';
import 'package:kovel_app/presentation/components/translate/translate_bottom_sheet.dart';
import 'package:provider/provider.dart';

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
            onPressed: () {
              Clipboard.setData(ClipboardData(text: widget.text));
              context.pop();
            },
            child: Text('Copy'),
            trailingIcon: Icons.copy,
          ),
          CupertinoContextMenuAction(
              onPressed: () {
                context.pop();
                showModalBottomSheet(
                  elevation: 0,
                  context: context,
                  builder: (BuildContext context) {
                    return ChangeNotifierProvider(
                      create: (_) => AiProvider(getTranslatedDataStreamUseCase: GetTranslatedDataStreamUseCase(aiRepository: getIt())),
                        child: TranslateBottomSheet(text: widget.text)
                    );
                  },
                );
              },
              child: Text('Translate'),
              trailingIcon: Icons.translate)
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
                  child: Padding(padding: padding, child: widget.child)));
        });
  }
}
