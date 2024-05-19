abstract interface class LikedTourDataSource {
  Future<void> createLikedTour({required int id, required String lang});
  Future<Map<String, dynamic>?> getTour({required int id});
  Future<void> likeTour({required int id, required String lang});
  Future<void> unLikeTour({required int id});
  Future<List<int>> getPopularTourIdList({required String lang, required int count});
}