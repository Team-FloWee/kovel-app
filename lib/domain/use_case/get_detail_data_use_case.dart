import 'package:kovel_app/domain/model/detail/unified_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetDetailDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  GetDetailDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<UnifiedDetail> execute({int pageNo = 1, required int id, required int contentTypeId}) async {
    final result = await _tourInfoRepository.getUnifiedDetail(id: id, contentTypeId: contentTypeId);
    return result.first;
  }
}
