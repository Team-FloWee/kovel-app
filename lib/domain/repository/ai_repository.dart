abstract interface class AiRepository {
  Future<String> getTranslation({required String request, required String language});
}