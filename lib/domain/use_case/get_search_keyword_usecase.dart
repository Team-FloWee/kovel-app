import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetSearchKeywordUseCase {
  final TourInfoRepository _tourInfoRepository;

  GetSearchKeywordUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<Tour>> execute({
    int pageNo = 1,
    required String query,
  }) async {
    return await _tourInfoRepository.getSearchKeyword(keyword: query, pageNo: pageNo);
  }
}
