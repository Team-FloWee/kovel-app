import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'ai_data_source.dart';

class AiDataSourceImpl implements AiDataSource {
  final GenerativeModel _model = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.get('GEMINI_API_KEY'));

  @override
  Future<GenerateContentResponse> chatToAi({required String query}) async {
    final content = [Content.text(query)];
    final response = await _model.generateContent(content);
    return response;
  }
}