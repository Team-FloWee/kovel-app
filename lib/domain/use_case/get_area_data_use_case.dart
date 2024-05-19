import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../model/tour.dart';

class GetAreaDataUseCase {
  final TourInfoRepository _tourInfoRepository;

  const GetAreaDataUseCase({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  Future<Result<List<Tour>,NetworkError>> execute({int pageNo = 1, required String areaCode, required String cat2, required int contentTypeId}) async {
    final result = await _tourInfoRepository.getAreaBasedList(areaCode: areaCode, cat2: cat2, contentTypeId: contentTypeId, pageNo: pageNo);

    switch (result) {
      case Success<List<Tour>, NetworkError>():
        return Result.success(result.data);
      case Error<List<Tour>, NetworkError>():
        {
          switch (result.error) {
            case NetworkError.unauthorized:
              return Result.error(NetworkError.unauthorized);
            case NetworkError.notFound:
              return Result.error(NetworkError.notFound);
            case NetworkError.serverError:
              return Result.error(NetworkError.serverError);
            case NetworkError.requestTimeout:
              return Result.error(NetworkError.requestTimeout);
            case NetworkError.unknown:
              return Result.error(NetworkError.unknown);
          }
        }
    }
  }
}
