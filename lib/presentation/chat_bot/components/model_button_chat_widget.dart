import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/enum/chat_case.dart';

class ModelButtonChatWidget extends StatelessWidget {
  final String text;
  final ChatCase chatCase;

  const ModelButtonChatWidget(
      {super.key, required this.text, required this.chatCase});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            switch (chatCase) {
              case ChatCase.recommendPlan:
                // TODO: Handle this case.
              case ChatCase.archiveBaseCourse:
                // TODO: Handle this case.
              case ChatCase.text:
                // TODO: Handle this case.
            }
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
