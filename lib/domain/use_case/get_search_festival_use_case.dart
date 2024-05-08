import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../model/tour.dart';

class GetSearchFestivalUseCase {
  final TourInfoRepository _tourInfoRepository;

  const GetSearchFestivalUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<Tour>> execute({int pageNo = 1, required String eventStartDate, required String eventEndDate}) async {
    // TODO: 시작일 언제로 할지?
    final result = await _tourInfoRepository.getSearchFestival(pageNo: pageNo, eventStartDate: eventStartDate, eventEndDate: eventEndDate);
    return result;
  }
}
