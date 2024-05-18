import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class SendChatToAiUseCase {
  final AiRepository _aiRepository;

  SendChatToAiUseCase({required AiRepository aiRepository})
      : _aiRepository = aiRepository;

  Future<GenerateContentResponse> execute({required String request}) async {
    return await _aiRepository.sendChatToAi(request: request);
  }
}