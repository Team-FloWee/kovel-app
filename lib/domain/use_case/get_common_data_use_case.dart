import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetCommonDataUseCase {
  TourInfoRepository _tourInfoRepository;

  GetCommonDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<List<TourDetail>> getCommonData(int id, int contentTypeId) async {
    return await _tourInfoRepository.getDetailCommon(id: id);
  }
}
// getDetailData 소개
// getInfoData 반복
