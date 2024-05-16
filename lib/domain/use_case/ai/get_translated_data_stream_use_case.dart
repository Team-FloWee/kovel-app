import 'dart:async';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class GetTranslatedDataStreamUseCase {
  final AiRepository _aiRepository;

  GetTranslatedDataStreamUseCase({required AiRepository aiRepository})
      : _aiRepository = aiRepository;

  Stream<GenerateContentResponse> execute(
      {required String request, required String language}) {
    final response = _aiRepository.getTranslatedDataStream(
        request: request, language: language);
    switch (response) {
      case Success<Stream<GenerateContentResponse>, NetworkError>():
        return response.data;
      case Error<Stream<GenerateContentResponse>, NetworkError>():
        {
          return response.error.message as Stream<GenerateContentResponse>;
        }
    }
  }
}
