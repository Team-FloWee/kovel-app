import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class GetCommonDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  GetCommonDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<TourDetail> execute({int pageNo = 1, required int id}) async {
    final result = await _tourInfoRepository.getDetailCommon(id: id);
    return result.first;
  }
}
