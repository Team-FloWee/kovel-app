import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/data/data_source/ai_data_source.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class AiRepositoryImpl implements AiRepository {
  final AiDataSource _aiDataSource;

  AiRepositoryImpl({required AiDataSource aiDataSource})
      : _aiDataSource = aiDataSource;

  @override
  Stream<GenerateContentResponse> getTranslatedDataStream(
      {required String request, required String language}) {
    final response =
        _aiDataSource.chatToAi(query: 'please translate to $language $request');
    switch (response) {
      case Success<Stream<GenerateContentResponse>, NetworkError>():
        return response.data;
      case Error<Stream<GenerateContentResponse>, NetworkError>():
        {
          switch (response.error) {
            case NetworkError.requestTimeout:
              throw NetworkError.requestTimeout;
            case NetworkError.unknown:
              throw NetworkError.unknown;
          }
        }
    }
  }
}
