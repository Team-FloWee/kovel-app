import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/enum/chat_case.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/chat.dart';
import 'package:kovel_app/presentation/chat_bot/chat_bot_view_model.dart';
import 'package:kovel_app/presentation/chat_bot/components/chat_category_widget.dart';
import 'package:provider/provider.dart';

class ModelButtonChatWidget extends StatelessWidget {
  final Chat chat;

  const ModelButtonChatWidget(
      {super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatBotViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                viewModel.addUserChat(request: chat.text);
                switch (chat.chatCase) {
                  case ChatCase.recommendPlan:
                    viewModel.recommendPlan();
                  case ChatCase.archiveBasedCourse:
                    viewModel.recommendArchiveBasedCourse();
                  case ChatCase.restart:
                    viewModel.restart();
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
                          chat.text,
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
        ),
      ],
    );
  }
}
