import 'package:kovel_app/data/data_source/firebase/liked_tour_data_source.dart';
import 'package:kovel_app/domain/repository/firebase/liked_tour_repository.dart';

class LikedTourRepositoryImpl implements LikedTourRepository{
  final LikedTourDataSource _likedTourDataSource;

  LikedTourRepositoryImpl({required LikedTourDataSource likedTourDataSource}) : _likedTourDataSource = likedTourDataSource;

  @override
  Future<void> createLikedTour({required int id}) async {
    await _likedTourDataSource.createLikedTour(id: id);
  }

  @override
  Future<Map<String, dynamic>?> getTour({required int id}) async {
   return await _likedTourDataSource.getTour(id: id);
  }

  @override
  Future<void> likeTour({required int id}) async {
    await _likedTourDataSource.likeTour(id: id);
  }

  @override
  Future<void> unLikeTour({required int id}) async {
    await _likedTourDataSource.unLikeTour(id: id);
  }
}