import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/core/enum/chat_case.dart';
import 'package:kovel_app/domain/model/chat.dart';
import 'package:kovel_app/presentation/chat_bot/chat_bot_view_model.dart';
import 'package:kovel_app/presentation/chat_bot/components/chat_category_widget.dart';
import 'package:provider/provider.dart';

class ModelChatWidget extends StatelessWidget {
  final Chat chat;
  const ModelChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatBotViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: UiConfig.black.shade100,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(chat.text, style: UiConfig.h4Style),
            ),
          ),
        ),
        chat.chatCase == ChatCase.archiveBasedCourse ? ChatCategoryWidget(
            onSelect: (String value) {
              final List<String> archivedNames = userProvider.user.archivedList.map((e) => e.title).toList();
              viewModel.sendChat(header: '${archivedNames.toString()} 포함해서',  request: value);
            },
            categoryData: const ['당일', '1박 2일', '2박 3일', '3박 4일','4박 5일', '5박 6일', '1주일']
        ) : const SizedBox()
      ],
    );
  }
}
