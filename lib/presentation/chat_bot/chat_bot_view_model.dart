import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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

  void getChatSession() {
    _chatList = [];
    final chatSession = _getChatSessionUseCase.execute();
    for (var content in chatSession.history) {
      for (var part in content.parts) {
        if (part is TextPart) {
          _chatList.add(Chat(text: part.text, role: content.role ?? 'model'));
          notifyListeners();
        }
      }
    }
  }

  void sendChat({required String request}) async {
    _chatList.add(Chat(text: request, role: 'user'));
    notifyListeners();
    final response = await _sendChatToAiUseCase.execute(request: request);
    _chatList.add(Chat(text: response.text ?? '', role: 'model'));
    notifyListeners();
  }
}