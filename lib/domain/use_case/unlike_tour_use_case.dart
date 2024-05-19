import 'package:kovel_app/domain/repository/liked_tour_repository.dart';

class UnLikeTourUseCase {
  final LikedTourRepository _likedTourRepository;

  UnLikeTourUseCase({required LikedTourRepository likedTourRepository}) : _likedTourRepository = likedTourRepository;

  Future<void> execute({required int id}) async {
    await _likedTourRepository.unLikeTour(id: id);
  }
}