import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/data/mapper/tour_detail_mapper.dart';
import 'package:kovel_app/data/mapper/tour_mapper.dart';
import 'package:kovel_app/data/mapper/unified_detail_mapper.dart';
import 'package:kovel_app/data/mapper/unified_info_mapper.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../../domain/model/tour.dart';
import '../data_source/tour_info_data_source.dart';
import '../dto/content_detail_dto.dart';
import '../dto/content_detail_info_dto.dart';
import '../dto/tour_dto.dart';

class TourInfoRepositoryImpl implements TourInfoRepository {
  final TourInfoDataSource _tourInfoDataSource;

  TourInfoRepositoryImpl({
    required TourInfoDataSource tourInfoDataSource,
  }) : _tourInfoDataSource = tourInfoDataSource;

  // 지역 기반 관광 정보 조회 (area based list)
  @override
  Future<List<Tour>> getAreaBasedList(
      {int pageNo = 1,
      int? contentTypeId,
      String areaCode = '',
      String cat2 = ''}) async {
    final List<TourDto> tourDto = await _tourInfoDataSource.getAreaBasedList(
        contentTypeId: contentTypeId, areaCode: areaCode, cat2: cat2);
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 키워드 검색 조회 (search keyword)
  @override
  Future<List<Tour>> getSearchKeyword({
    int pageNo = 1,
    required String keyword,
  }) async {
    final List<TourDto> tourDto =
        await _tourInfoDataSource.getSearchKeyword(keyword: keyword);
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 축제 공연 행사 검색 조회 (search Festival)
  @override
  Future<List<Tour>> getSearchFestival({
    int pageNo = 1,
    required String eventStartDate,
    required String eventEndDate,
  }) async {
    final List<TourDto> tourDto = await _tourInfoDataSource.getSearchFestival(
        eventStartDate: eventStartDate, eventEndDate: eventEndDate);
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 위치 기반 관광 정보 조회 (location based list)
  @override
  Future<List<Tour>> getLocationBasedList({
    int pageNo = 1,
    required String mapX,
    required String mapY,
    required String radius,
  }) async {
    final List<TourDto> tourDto = await _tourInfoDataSource
        .getLocationBasedList(mapX: mapX, mapY: mapY, radius: radius);
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 숙박 정보 조회 (search stay)
  @override
  Future<List<Tour>> getSearchStay({int pageNo = 1}) async {
    final List<TourDto> tourDto = await _tourInfoDataSource.getSearchStay();
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 공통 정보 조회 (detail info)
  @override
  Future<List<TourDetail>> getDetailCommon({
    int pageNo = 1,
    required int id,
  }) async {
    final List<TourDetailDto> tourDetailDto =
        await _tourInfoDataSource.getDetailCommon(id: id);
    return tourDetailDto.map((e) => e.toTourDetail()).toList();
  }

  @override
  Future<List<UnifiedDetail>> getUnifiedDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> detailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return detailDto.map((e) => e.toUnifiedDetail()).toList();
  }

  // 반복 정보 조회 - 컨텐츠 별 (detail info - content detail info)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠)

  // 25: 여행 코스
  @override
  Future<List<UnifiedInfo>> getUnifiedInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailInfoDto> infoDto = await _tourInfoDataSource
        .getDetailInfo(id: id, contentTypeId: contentTypeId);
    return infoDto.map((e) => e.toUnifiedInfo()).toList();
  }
}
