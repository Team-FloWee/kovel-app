import 'package:google_generative_ai/google_generative_ai.dart';

abstract interface class AiDataSource {
  Stream<GenerateContentResponse> chatToAi({required String query});
}