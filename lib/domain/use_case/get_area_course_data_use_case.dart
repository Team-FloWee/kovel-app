import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../model/tour.dart';

class GetAreaCourseDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  const GetAreaCourseDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<Tour>> execute({required String areaCode, required String cat2}) async {
    final result = await _tourInfoRepository.getAreaBasedList(
        areaCode: areaCode, cat2: cat2, contentTypeId: 25);
    return result;
  }
}
