import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class ModelButtonChatWidget extends StatelessWidget {
  final String text;
  final void Function() action;

  const ModelButtonChatWidget(
      {super.key, required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            action();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: UiConfig.black.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: UiConfig.h4Style
                          .copyWith(color: UiConfig.black.shade900),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: UiConfig.black.shade900,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
