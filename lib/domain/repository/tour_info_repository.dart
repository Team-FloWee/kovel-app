import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';

import '../model/tour.dart';

abstract interface class TourInfoRepository {
  // 지역 기반 관광 정보 조회 (area based list)
  Future<Result<List<Tour>,NetworkError>> getAreaBasedList(
      {int pageNo = 1,
      int? contentTypeId,
      String areaCode = '',
      String cat2 = ''});

  // 키워드 검색 조회 (search keyword)
  Future<List<Tour>> getSearchKeyword({
    int pageNo = 1,
    required String keyword,
  });

  // 위치 기반 관광 정보 조회 (location based list)
  Future<List<Tour>> getLocationBasedList({
    int pageNo = 1,
    required String mapX,
    required String mapY,
    required String radius,
  });

  // 축제 공연 행사 검색 조회 (search Festival)
  Future<List<Tour>> getSearchFestival({
    int pageNo = 1,
    required String eventStartDate,
    required String eventEndDate,
  });

  // 숙박 정보 조회 (search stay)
  Future<List<Tour>> getSearchStay({int pageNo = 1});

  // 공통 정보 조회 (tour detail)
  Future<List<TourDetail>> getDetailCommon({
    int pageNo = 1,
    required int id,
  });

  Future<List<UnifiedDetail>> getUnifiedDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  });

  // 반복 정보 조회 - 컨텐츠 별 (content detail info)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠)
  Future<List<UnifiedInfo>> getUnifiedInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  });
}
