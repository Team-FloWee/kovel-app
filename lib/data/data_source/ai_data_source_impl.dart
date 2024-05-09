import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'ai_data_source.dart';

class AiDataSourceImpl implements AiDataSource {
  final String key = dotenv.get('GEMINI_API_KEY');

  @override
  Future<String> getTranslateEn(String request) async {
    if (key == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }
    final model = GenerativeModel(model: 'gemini-pro', apiKey: key);
    final content = [Content.text('please translate to english ${request}')];
    final response = await model.generateContent(content);
    return response.text ?? '';
  }
}