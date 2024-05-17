import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/chat_case.dart';
import 'package:kovel_app/core/enum/chat_type.dart';
import 'package:kovel_app/core/utils/markdown_util.dart';
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

  List<Chat> _chatList = [];
  List<Chat> get chatList => _chatList;
  bool _canInput = false;
  bool get canInput => _canInput;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  void sendChat({String header = '', required String request}) async {
    String query = request;
    if (_chatList.last.chatCase == ChatCase.recommendPlan && _chatList.last.chatType == ChatType.text) {
      query = '$request 관련된 대한민국에서 갈만한 구체적인 장소 5곳 정도만 부탁해';
    }
    if (_chatList.last.chatCase == ChatCase.archiveBasedCourse && _chatList.last.chatType == ChatType.text) {
      query = '$header$request 대한민국 여행 코스 짜줘';
    }
    _chatList.add(Chat(text: request, role: 'user', chatType: ChatType.text, chatCase: ChatCase.text));
    _canInput = false;
    _isLoading = true;
    notifyListeners();
    final response = await _sendChatToAiUseCase.execute(request: query);
    _isLoading = false;
    notifyListeners();
    final finalResponseText = MarkdownUtil().removeMarkdownTags(response.text ?? '');
    _chatList.add(Chat(text: finalResponseText, role: 'model', chatType: ChatType.text, chatCase: ChatCase.text));
    _chatList.add(Chat(text: '다시하기', role: 'function', chatType: ChatType.button, chatCase: ChatCase.restart));
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
    _canInput = true;
    notifyListeners();
  }

  void recommendArchiveBasedCourse() {
    _chatList.add(
        Chat(
            text: '당신의 취향에 맞는 여행 코스를 추천해드릴게요.\n여행할 기간을 선택해 주세요!',
            role: 'model',
            chatType: ChatType.text,
            chatCase: ChatCase.archiveBasedCourse
        )
    );
    notifyListeners();
  }

  void restart() {
    _chatList.addAll([
      Chat(
          text: '코블 AI 챗봇에 오신걸 환영합니다.\n어떤 정보를 찾으시나요?',
          role: 'model',
          chatType: ChatType.text,
          chatCase: ChatCase.text
      ),
      Chat(
          text: '아직 계획중이에요',
          role: 'function',
          chatType: ChatType.button,
          chatCase: ChatCase.recommendPlan
      ),
      Chat(
          text: '나의 좋아요 정보를 기반으로 추천받을래요',
          role: 'function',
          chatType: ChatType.button,
          chatCase: ChatCase.archiveBasedCourse
      ),
    ]);
  }
}