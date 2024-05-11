import 'dart:async';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class AiTranslateUseCase {
  final AiRepository _aiRepository;

  AiTranslateUseCase({required AiRepository aiRepository})
      : _aiRepository = aiRepository;

  Stream<GenerateContentResponse>? execute({required String request, required String language}) {
    final stream = _aiRepository.getTranslation(request: request, language: language);
    return stream;
  }
}