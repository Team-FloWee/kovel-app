import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/domain/model/chat.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class GetChatSessionUseCase {
  final AiRepository _aiRepository;

  GetChatSessionUseCase({required AiRepository aiRepository})
      : _aiRepository = aiRepository;

  ChatSession execute() {
    return _aiRepository.getChatSession();
  }
}