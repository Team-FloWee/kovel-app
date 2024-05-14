import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';

import 'ai_data_source.dart';

class AiDataSourceImpl implements AiDataSource {
  final GenerativeModel _model = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.get('GEMINI_API_KEY'));

  @override
  Result<Stream<GenerateContentResponse>,NetworkError> chatToAi({required String query}) {
    //'AiDataSourceImpl.chatToAi' ('Result<Stream<GenerateContentResponse>,
    // NetworkError> Function({required String query})') isn't a valid override of 'AiDataSource.chatToAi'
    // ('Stream<GenerateContentResponse> Function({required String query})'). (Documentation)
    // The member being overridden (ai_data_source.dart:5).
    try {
      final content = [Content.text(query)];
      final response = _model.generateContentStream(content);
      return Result.success(response);
    }on TimeoutException{
      return Result.error(NetworkError.requestTimeout);

    }catch(e){
      return Result.error(NetworkError.unknown);
    }
  }
}