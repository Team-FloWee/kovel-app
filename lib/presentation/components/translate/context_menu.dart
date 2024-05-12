import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/data/data_source/ai_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/ai_repository_impl.dart';
import 'package:kovel_app/di/di_setup.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';

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
    String translateData = '';
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
                    return Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Text('Translate',
                                  style: UiConfig.h4Style.copyWith(
                                      fontWeight: UiConfig.semiBoldFont)),
                              Spacer(),
                              Icon(Icons.close)
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Detected as'),
                                  DropdownButton<String>(
                                    items: [
                                      DropdownMenuItem<String>(
                                          value: 'English',
                                          child: Text('English (US)')),
                                      DropdownMenuItem<String>(
                                          value: 'Korea',
                                          child: Text('Korean (KR)')),
                                    ],
                                    isExpanded: false,
                                    onChanged: (dynamic value) {},
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: 300,
                                      child: Text(
                                        widget.text,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'more',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          StreamBuilder(
                              stream: GetTranslatedDataStreamUseCase(aiRepository: getIt()).execute(request: widget.text, language: 'english'),
                              builder: (context, snapshot) {
                                translateData += snapshot.data?.text ?? '';
                                // print(translateData);
                                return Container(height: 150,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          Text(translateData.toString()),
                                        ],
                                      )),
                                );
                              }),
                          Spacer(),
                          Row(
                            children: [
                              Text('Copy Translation'),
                              Spacer(),
                              Icon(Icons.copy),
                            ],
                          ),
                        ],
                      ),
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
