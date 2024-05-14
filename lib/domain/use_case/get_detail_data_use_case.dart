import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/domain/model/detail/unified_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetDetailDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  GetDetailDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<UnifiedDetail> execute({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    if (language != 'KorService1' && contentTypeId == 25) {
      // 코스 정보를 매직넘버로 주입하는 곳이 있어서 변환, null로 처리하는게 나은지 의논 필요
      contentTypeId = 0;

      final result = await _tourInfoRepository.getUnifiedDetail(
          id: id, contentTypeId: contentTypeId);

      return result.first;
    }
    final result = await _tourInfoRepository.getUnifiedDetail(
        id: id, contentTypeId: contentTypeId);
    return result.first;
  }
}
