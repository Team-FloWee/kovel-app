import 'package:google_generative_ai/google_generative_ai.dart';

abstract interface class AiRepository {
  Stream<GenerateContentResponse> getTranslatedDataStream({required String request, required String language});
  Future<GenerateContentResponse> sendChatToAi({required String request});
  ChatSession getChatSession();
}