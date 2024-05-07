import 'package:kovel_app/domain/model/detail/unified_info.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetInfoDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  GetInfoDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<UnifiedInfo>> execute(
      {required int id, required int contentTypeId}) async {
    final result = await _tourInfoRepository.getUnifiedInfo(
        id: id, contentTypeId: contentTypeId);
    return result;
  }
}
