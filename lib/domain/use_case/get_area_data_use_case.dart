import 'package:kovel_app/domain/repository/tour_info_repository.dart';
import '../../data/data_source/tour_info_data_source_impl.dart';
import '../model/tour.dart';

class GetAreaDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  const GetAreaDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<Tour>> execute({
    int pageNo = 1,
    required String areaCode,
    required String cat2,
    required int contentTypeId,
  }) async {
    if (language != 'KorService1' && contentTypeId == 25) {
      // 코스 정보를 매직넘버로 주입하는 곳이 있어서 변환, null로 처리하는게 나은지 의논 필요
      contentTypeId = 0;

      final result = await _tourInfoRepository.getAreaBasedList(
          areaCode: areaCode, cat2: cat2, contentTypeId: contentTypeId);

      return result;
    }
    final result = await _tourInfoRepository.getAreaBasedList(
        areaCode: areaCode, cat2: cat2, contentTypeId: contentTypeId);
    return result;
  }
}
