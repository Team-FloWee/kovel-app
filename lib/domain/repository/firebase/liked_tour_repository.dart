abstract interface class LikedTourRepository {
  Future<void> createLikedTour({required int id});
  Future<Map<String, dynamic>?> getTour({required int id});
  Future<void> likeTour({required int id});
  Future<void> unLikeTour({required int id});
  Future<List<int>> getPopularTourIdList({required int count});
}