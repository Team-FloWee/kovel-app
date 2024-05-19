import 'package:kovel_app/data/data_source/liked_tour_data_source.dart';
import 'package:kovel_app/domain/repository/liked_tour_repository.dart';

class LikedTourRepositoryImpl implements LikedTourRepository{
  final LikedTourDataSource _likedTourDataSource;

  LikedTourRepositoryImpl({required LikedTourDataSource likedTourDataSource}) : _likedTourDataSource = likedTourDataSource;

  @override
  Future<void> createLikedTour({required int id, required String lang}) async {
    await _likedTourDataSource.createLikedTour(id: id, lang: lang);
  }

  @override
  Future<Map<String, dynamic>?> getTour({required int id}) async {
   return await _likedTourDataSource.getTour(id: id);
  }

  @override
  Future<void> likeTour({required int id, required String lang}) async {
    await _likedTourDataSource.likeTour(id: id, lang: lang);
  }

  @override
  Future<void> unLikeTour({required int id}) async {
    await _likedTourDataSource.unLikeTour(id: id);
  }

  @override
  Future<List<int>> getPopularTourIdList({required String lang, required int count}) async {
    return await _likedTourDataSource.getPopularTourIdList(lang: lang, count: count);
  }
}