import 'dart:async';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class GetTranslatedDataStreamUseCase {
  final AiRepository _aiRepository;

  GetTranslatedDataStreamUseCase({required AiRepository aiRepository}) : _aiRepository = aiRepository;

  Result<Stream<GenerateContentResponse>, NetworkError> execute({required String request, required String language}) {
    try {
      final response = _aiRepository.getTranslatedDataStream(request: request, language: language);
      return Result.success(response);
    } catch (e) {
      return const Result.error(NetworkError.unknown);
    }
  }
}
