import 'package:google_generative_ai/google_generative_ai.dart';

abstract interface class AiDataSource {
  Stream<GenerateContentResponse> sendToAi({required String query});
}