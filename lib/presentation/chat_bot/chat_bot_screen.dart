import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/chat.dart';
import 'package:kovel_app/presentation/chat_bot/chat_bot_view_model.dart';
import 'package:kovel_app/presentation/chat_bot/components/model_button_chat_widget.dart';
import 'package:kovel_app/presentation/chat_bot/components/chat_input.dart';
import 'package:kovel_app/presentation/chat_bot/components/model_chat_widget.dart';
import 'package:kovel_app/presentation/chat_bot/components/model_loading_widget.dart';
import 'package:kovel_app/presentation/chat_bot/components/user_chat_widget.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:provider/provider.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ChatBotViewModel>().fetchChatList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatBotViewModel>();
    return Scaffold(
      appBar: CommonAppBar(title: 'AI 톡톡'.tr(),),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 1.sh
          ),
          color: UiConfig.black.shade500,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.chatList.length,
                      itemBuilder: (context, index) {
                        return _buildChatWidget(chat: viewModel.chatList[index]);
                      }
                    ),
                    viewModel.isLoading == true
                        ? const ModelLoadingWidget()
                        : const SizedBox(),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ChatInput()
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget _buildChatWidget({required Chat chat}) {
    switch (chat.role) {
      case 'model':
        return ModelChatWidget(chat: chat);
      case 'user':
        return UserChatWidget(chat: chat);
      case 'function':
        return ModelButtonChatWidget(chat: chat);
      default:
        return const SizedBox();
    }
  }
}