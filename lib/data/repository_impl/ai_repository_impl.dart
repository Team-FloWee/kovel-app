import 'package:kovel_app/data/data_source/ai_data_source.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';

class AiRepositoryImpl implements AiRepository {
  final AiDataSource _aiDataSource;

  AiRepositoryImpl({required AiDataSource aiDataSource}) : _aiDataSource = aiDataSource;

  Future<String> getTranslation({required String request, required String language}) async {
    try {
      final response = await _aiDataSource.chatToAi(query: 'please translate to $language $request');
      return response.text ?? '';
    } catch (e) {
      return 'Ai getTranslation() Error';
    }
  }
}