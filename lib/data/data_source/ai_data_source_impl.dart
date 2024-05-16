import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';

import 'ai_data_source.dart';

class AiDataSourceImpl implements AiDataSource {
  final GenerativeModel _model = GenerativeModel(
      model: 'gemini-pro', apiKey: dotenv.get('GEMINI_API_KEY'));

  @override
  Result<Stream<GenerateContentResponse>, NetworkError> chatToAi(
      {required String query}) {
    try {
      final content = [Content.text(query)];
      final response = _model.generateContentStream(content);

      return Result.success(response);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
