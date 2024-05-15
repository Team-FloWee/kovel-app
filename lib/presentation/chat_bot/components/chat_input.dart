import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/chat_bot/chat_bot_view_model.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatBotViewModel>();
    return Container(
      color: UiConfig.black.shade500,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: UiConfig.black.shade100,
                borderRadius: BorderRadius.circular(8)
              ),
              child: SizedBox(
                height: 56.w,
                child: TextField(
                  maxLines: 1,
                  controller: _textController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: UiConfig.h4Style,
                  decoration: InputDecoration(
                    isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: UiConfig.black.shade100),
                          borderRadius: BorderRadius.circular(8)
                      ) ,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: UiConfig.black.shade100),
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                  onSubmitted: (value) {
                    viewModel.sendChat(request: value);
                    _textController.text = '';
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              viewModel.sendChat(request: _textController.text);
              _textController.text = '';
            },
            splashColor: Colors.red,
            highlightColor: Colors.red.withOpacity(0.5),
            child: Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: UiConfig.primaryColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.send, color: UiConfig.black.shade100)
              ),
          ),
        ],
      ),
    );
  }
}
