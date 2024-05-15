import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/chat.dart';
import 'package:kovel_app/presentation/chat_bot/chat_bot_view_model.dart';
import 'package:kovel_app/presentation/chat_bot/components/model_chat_widget.dart';
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
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatBotViewModel>();
    return Scaffold(
      appBar: CommonAppBar(title: 'AI 챗봇'),
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
                  children: [
                    SizedBox(height: 24),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.chatList.length,
                      itemBuilder: (context, index) {
                        return _buildChatWidget(chat: viewModel.chatList[index]);
                      }
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          viewModel.sendChat(request: value);
                          _textController.text = '';
                        },
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        controller: _textController,
                      ),
                    ),
                    SizedBox(
                      width: 40, height: 40,
                      child: IconButton(
                        onPressed: () {
                          viewModel.sendChat(request: _textController.text);
                          _textController.text = '';
                        },
                        icon: Icon(Icons.send),
                      ),
                    )
                  ],
                ),
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
        return ModelChatWidget(text: chat.text);
      case 'user':
        return UserChatWidget(text: chat.text);
      default:
        return const SizedBox();
    }
  }
}