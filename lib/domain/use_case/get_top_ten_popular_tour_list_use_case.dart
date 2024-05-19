import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/firebase/liked_tour_repository.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetTopTenPopularTourListUseCase {
  final LikedTourRepository _likedTourRepository;
  final TourInfoRepository _tourInfoRepository;

  GetTopTenPopularTourListUseCase({
    required LikedTourRepository likedTourRepository,
    required TourInfoRepository tourInfoRepository,
  }) : _likedTourRepository = likedTourRepository,
        _tourInfoRepository = tourInfoRepository;

  Future<List<TourDetail>> execute({required String lang}) async {
    final List<TourDetail> result = [];
    final List<int> idList = await _likedTourRepository.getPopularTourIdList(lang: lang, count: 10);
    for (int id in idList) {
      result.add((await _tourInfoRepository.getDetailCommon(id: id)).first);
    }
    return result;
  }
}