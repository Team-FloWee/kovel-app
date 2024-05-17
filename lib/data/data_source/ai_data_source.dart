import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';

abstract interface class AiDataSource {
  Stream<GenerateContentResponse> chatToAi({required String query});
}
