import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../model/tour.dart';

class GetAreaDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  const GetAreaDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<Tour>> execute(
      {required String areaCode,
      required String cat2,
      required int contentTypeId}) async {
    final result = await _tourInfoRepository.getAreaBasedList(
        areaCode: areaCode, cat2: cat2, contentTypeId: contentTypeId);
    return result;
  }
}
