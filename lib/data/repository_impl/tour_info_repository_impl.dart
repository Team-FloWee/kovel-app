import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/data/mapper/content_detail_info_mapper.dart';
import 'package:kovel_app/data/mapper/content_detail_mapper.dart';
import 'package:kovel_app/data/mapper/tour_detail_mapper.dart';
import 'package:kovel_app/data/mapper/tour_mapper.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail_info.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail_info.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail_info.dart';
import 'package:kovel_app/domain/model/detail/lodgment/lodgment_detail.dart';
import 'package:kovel_app/domain/model/detail/restaurant/restaurant_detail.dart';
import 'package:kovel_app/domain/model/detail/shopping/shopping_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail_info.dart';
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
  Future<List<Tour>> getAreaBasedList({int pageNo = 1}) async {
    final List<TourDto> tourDto = await _tourInfoDataSource.getAreaBasedList();
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

  // 소개 정보 조회 - 컨텐츠 별 (detail intro - content detail)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점)

  // 25: 여행 코스
  @override
  Future<List<CourseDetail>> getCourseDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> courseDetailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return courseDetailDto.map((e) => e.toCourseDetail()).toList();
  }

  // 14: 문화 시설
  @override
  Future<List<CultureLocationDetail>> getCultureLocationDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> cultureLocationDetailDto =
        await _tourInfoDataSource.getDetailIntro(
            id: id, contentTypeId: contentTypeId);
    return cultureLocationDetailDto
        .map((e) => e.toCultureLocationDetail())
        .toList();
  }

  // 15: 축제 공연 행사
  @override
  Future<List<FestivalDetail>> getFestivalDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> festivalDetailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return festivalDetailDto.map((e) => e.toFestivalDetail()).toList();
  }

  // 28: 레포츠
  @override
  Future<List<LeportsDetail>> getLeportsDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> leportsDetailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return leportsDetailDto.map((e) => e.toLeportsDetail()).toList();
  }

  // 32: 숙박
  @override
  Future<List<LodgmentDetail>> getLodgmentDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> lodgmentDetailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return lodgmentDetailDto.map((e) => e.toLodgmentDetail()).toList();
  }

  // 39: 음식점
  @override
  Future<List<RestaurantDetail>> getRestaurantDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> restaurantDetailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return restaurantDetailDto.map((e) => e.toRestaurantDetail()).toList();
  }

  // 38: 쇼핑
  @override
  Future<List<ShoppingDetail>> getShoppingDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> shoppingDetailDto = await _tourInfoDataSource
        .getDetailIntro(id: id, contentTypeId: contentTypeId);
    return shoppingDetailDto.map((e) => e.toShoppingDetail()).toList();
  }

  // 12: 관광지
  @override
  Future<List<TouristSpotDetail>> getTouristSpotDetail({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailDto> touristSpotDetailDto =
        await _tourInfoDataSource.getDetailIntro(
            id: id, contentTypeId: contentTypeId);
    return touristSpotDetailDto.map((e) => e.toTouristSpotDetail()).toList();
  }

  // 반복 정보 조회 - 컨텐츠 별 (detail info - content detail info)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠)

  // 25: 여행 코스
  @override
  Future<List<CourseDetailInfo>> getCourseDetailInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailInfoDto> courseDetailInfoDto =
        await _tourInfoDataSource.getDetailInfo(
            id: id, contentTypeId: contentTypeId);
    return courseDetailInfoDto.map((e) => e.toCourseDetailInfo()).toList();
  }

  // 14: 문화 시설
  @override
  Future<List<CultureLocationDetailInfo>> getCultureLocationDetailInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailInfoDto> cultureLocationDetailInfo =
        await _tourInfoDataSource.getDetailInfo(
            id: id, contentTypeId: contentTypeId);
    return cultureLocationDetailInfo
        .map((e) => e.toCultureLocationDeteailInfo())
        .toList();
  }

  // 15: 축제 공연 행사
  @override
  Future<List<FestivalDetailInfo>> getFestivalDetailInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailInfoDto> festivalDetailInfo =
        await _tourInfoDataSource.getDetailInfo(
            id: id, contentTypeId: contentTypeId);
    return festivalDetailInfo.map((e) => e.toFestivalDetailInfo()).toList();
  }

  // 28: 레포츠
  @override
  Future<List<LeportsDetailInfo>> getLeportsDetailInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailInfoDto> leportsDetailInfo =
        await _tourInfoDataSource.getDetailInfo(
            id: id, contentTypeId: contentTypeId);
    return leportsDetailInfo.map((e) => e.toLeportsDetailInfo()).toList();
  }

  // 12: 관광지
  @override
  Future<List<TouristSpotDetailInfo>> getTouristSpotDetailInfo({
    int pageNo = 1,
    required int id,
    required int contentTypeId,
  }) async {
    final List<ContentDetailInfoDto> touristSpotDetailInfo =
        await _tourInfoDataSource.getDetailInfo(
            id: id, contentTypeId: contentTypeId);
    return touristSpotDetailInfo
        .map((e) => e.toTouristSpotDetailInfo())
        .toList();
  }
}
