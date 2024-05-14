import 'package:kovel_app/domain/repository/firebase/liked_tour_repository.dart';

class LikeTourUseCase {
  final LikedTourRepository _likedTourRepository;

  LikeTourUseCase({required LikedTourRepository likedTourRepository}) : _likedTourRepository = likedTourRepository;

  Future<void> execute({required int id}) async {
    await _likedTourRepository.likeTour(id: id);
  }
}