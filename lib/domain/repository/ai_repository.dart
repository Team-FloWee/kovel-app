import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';

abstract interface class AiRepository {
  Result<Stream<GenerateContentResponse>, NetworkError> getTranslatedDataStream({required String request, required String language});
}