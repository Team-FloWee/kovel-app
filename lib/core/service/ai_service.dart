import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';

class AiService {
  final GetTranslatedDataStreamUseCase _getTranslatedDataStreamUseCase;

  AiService({required GetTranslatedDataStreamUseCase getTranslatedDataStreamUseCase}) : _getTranslatedDataStreamUseCase = getTranslatedDataStreamUseCase;

  Stream<GenerateContentResponse> getTranslatedDataStream({required String request, required String language}) {
    final stream = _getTranslatedDataStreamUseCase.execute(request: request, language: language);
    return stream;
  }
}