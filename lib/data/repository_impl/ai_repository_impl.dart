import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/data/data_source/ai_data_source.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class AiRepositoryImpl implements AiRepository {
  final AiDataSource _aiDataSource;

  AiRepositoryImpl({required AiDataSource aiDataSource}) : _aiDataSource = aiDataSource;

  @override
  Stream<GenerateContentResponse> getTranslatedDataStream({required String request, required String language}) {
    final response = _aiDataSource.sendToAi(query: 'please translate to $language $request');
    return response;
  }
}