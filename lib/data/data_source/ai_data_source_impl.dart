import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/chat_case.dart';

import 'ai_data_source.dart';

class AiDataSourceImpl implements AiDataSource {
  final GenerativeModel _model = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.get('GEMINI_API_KEY'));

  @override
  Stream<GenerateContentResponse> sendToAi({required String query}) {
    final content = [Content.text(query)];
    final response = _model.generateContentStream(content);
    return response;
  }

  final ChatSession _chat = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.get('GEMINI_API_KEY')).startChat(
    history: [
      Content.model([TextPart('코블 AI 챗봇에 오신걸 환영합니다.\n어떤 정보를 찾으시나요?')]),
      Content.functionResponse('아직 계획중이에요', {'type': 'button', 'chatCase': ChatCase.recommendPlan}),
      Content.functionResponse('나의 좋아요 정보를 기반으로 추천받을래요', {'type': 'button', 'chatCase': ChatCase.archiveBaseCourse})
    ]
  );

  @override
  Future<GenerateContentResponse> chatToAi({required String query}) async {
    final content = Content.text(query);
    return await _chat.sendMessage(content);
  }

  @override
  ChatSession getChatSession() {
    return _chat;
  }
}