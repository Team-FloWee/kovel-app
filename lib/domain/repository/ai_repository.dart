import 'package:google_generative_ai/google_generative_ai.dart';

abstract interface class AiRepository {
  Stream<GenerateContentResponse>? getTranslation({required String request, required String language});
}