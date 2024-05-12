import 'dart:async';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class GetTranslatedDataStreamUseCase {
  final AiRepository _aiRepository;

  GetTranslatedDataStreamUseCase({required AiRepository aiRepository})
      : _aiRepository = aiRepository;

  Stream<GenerateContentResponse> execute({required String request, required String language}) {
    final response = _aiRepository.getTranslatedDataStream(request: request, language: language);
    return response;
  }
}