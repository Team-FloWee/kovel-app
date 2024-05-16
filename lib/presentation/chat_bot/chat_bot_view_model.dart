import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/chat_case.dart';
import 'package:kovel_app/core/enum/chat_type.dart';
import 'package:kovel_app/domain/model/chat.dart';
import 'package:kovel_app/domain/use_case/ai/get_chat_session_use_case.dart';
import 'package:kovel_app/domain/use_case/ai/send_chat_to_ai_use_case.dart';

class ChatBotViewModel with ChangeNotifier {
  final SendChatToAiUseCase _sendChatToAiUseCase;
  final GetChatSessionUseCase _getChatSessionUseCase;

  ChatBotViewModel({
    required SendChatToAiUseCase sendChatToAiUseCase,
    required GetChatSessionUseCase getChatSessionUseCase
  }) : _sendChatToAiUseCase = sendChatToAiUseCase,
        _getChatSessionUseCase = getChatSessionUseCase;

  StreamSubscription? _subscription;

  List<Chat> _chatList = [];
  List<Chat> get chatList => _chatList;

  void fetchChatList() {
    _chatList = [];
    final chatSession = _getChatSessionUseCase.execute();
    for (var content in chatSession.history) {
      for (var part in content.parts) {
        if (part is TextPart) {
          _chatList.add(
              Chat(
                  text: part.text,
                  role: content.role ?? 'model',
                  chatType: ChatType.text,
                  chatCase: ChatCase.text
              )
          );
        } else if (part is FunctionResponse) {
          _chatList.add(
              Chat(
                  text: part.name,
                  role: content.role ?? 'function',
                  chatType: ChatType.fromString(part.response!['chatType'].toString() ?? ''),
                  chatCase: ChatCase.fromString(part.response!['chatCase'].toString() ?? ''
                  )
              )
          );
        }
        notifyListeners();
      }
    }
  }

  void sendChat({required String request}) async {
    String query = request;
    if (_chatList.last.chatCase == ChatCase.recommendPlan && _chatList.last.chatType == ChatType.text) {
      query = '$request 관련된 대한민국에서 갈만한 구체적인 장소 5곳 정도만 부탁해';
    }
    _chatList.add(Chat(text: request, role: 'user', chatType: ChatType.text, chatCase: ChatCase.text));
    notifyListeners();
    final response = await _sendChatToAiUseCase.execute(request: query);
    _chatList.add(Chat(text: response.text ?? '', role: 'model', chatType: ChatType.text, chatCase: ChatCase.text));
    notifyListeners();
  }

  void addUserChat({required String request}) async {
    _chatList.add(Chat(text: request, role: 'user', chatType: ChatType.text, chatCase: ChatCase.text));
    notifyListeners();
  }

  void recommendPlan() {
    _chatList.add(
        Chat(
          text: '어떤 여행을 추천받고 싶나요?\n(예시: 힐링, 액티비티, 반려동물...)',
          role: 'model',
          chatType: ChatType.text,
          chatCase: ChatCase.recommendPlan
        )
    );
  }
}