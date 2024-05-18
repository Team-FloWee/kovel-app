import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../model/tour.dart';

class GetLocationBasedDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  const GetLocationBasedDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<Tour>> execute({
    int pageNo = 1,
    required String mapX,
    required String mapY,
    required String radius,
  }) async {
    final result = await _tourInfoRepository.getLocationBasedList(mapX: mapX, mapY: mapY, radius: radius, pageNo: pageNo);
    return result;
  }
}
