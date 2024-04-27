import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/data/dto/tour_detail_dto.dart';
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
import '../dto/tour_dto.dart';

class TourInfoRepositoryImpl implements TourInfoRepository {
  final TourInfoDataSource _tourInfoDataSource;

  TourInfoRepositoryImpl({
    required TourInfoDataSource tourInfoDataSource,
  }) : _tourInfoDataSource = tourInfoDataSource;

  // 지역 기반 관광 정보 조회 (area based list)
  @override
  Future<List<Tour>> getAreaBasedList() async {
    final List<TourDto> tourDto = await _tourInfoDataSource.getAreaBasedList();
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 키워드 검색 조회 (search keyword)
  @override
  Future<List<Tour>> getSearchKeyword(String keyword) async {
    final List<TourDto> tourDto =
        await _tourInfoDataSource.getSearchKeyword(keyword);
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 축제 공연 행사 검색 조회 (search Festival)
  @override
  Future<List<Tour>> getSearchFestival(String eventStartDate) async {
    final List<TourDto> tourDto =
        await _tourInfoDataSource.getSearchFestival(eventStartDate);
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 위치 기반 관광 정보 조회 (location based list)
  @override
  Future<List<Tour>> getLocationBasedList(
    String mapX,
    String mapY,
    String radius,
  ) async {
    final List<TourDto> tourDto =
        await _tourInfoDataSource.getLocationBasedList(mapX, mapY, radius);
    return tourDto.map((e) => e.toTour()).toList();
  }

  //  조회 (search stay)
  @override
  Future<List<Tour>> getSearchStay() async {
    final List<TourDto> tourDto = await _tourInfoDataSource.getSearchStay();
    return tourDto.map((e) => e.toTour()).toList();
  }

  // 공통 정보 조회 (detail info)
  @override
  Future<List<TourDetail>> getDetailCommon(String contentId) async {
    final List<TourDetailDto> tourDetailDto =
        await _tourInfoDataSource.getDetailCommon(contentId);
    return tourDetailDto.map((e) => e.toTourDetail()).toList();
  }

  // 소개 정보 조회 - 컨텐츠 별 (detail intro - content detail)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점)
  // 25: 여행 코스
  @override
  Future<List<CourseDetail>> getCourseDetail(
      String contentId, String contentTypeId) async {
    final List<ContentDetailDto> courseDetailDto =
        await _tourInfoDataSource.getDetailIntro(contentId, contentTypeId);
    return courseDetailDto.map((e) => e.toCourseDetail()).toList();
  }

  // 14: 문화 시설
  @override
  Future<List<CultureLocationDetail>> getCultureLocationDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getCultureLocationDetail
    throw UnimplementedError();
  }

  // 15: 축제 공연 행사
  @override
  Future<List<FestivalDetail>> getFestivalDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getFestivalDetail
    throw UnimplementedError();
  }

  // 28: 레포츠
  @override
  Future<List<LeportsDetail>> getLeportsDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getLeportsDetail
    throw UnimplementedError();
  }

  // 32: 숙박
  @override
  Future<List<LodgmentDetail>> getLodgmentDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getLodgmentDetail
    throw UnimplementedError();
  }

  // 39: 음식점
  @override
  Future<List<RestaurantDetail>> getRestaurantDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getRestaurantDetail
    throw UnimplementedError();
  }

  // 38: 쇼핑
  @override
  Future<List<ShoppingDetail>> getShoppingDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getShoppingDetail
    throw UnimplementedError();
  }

  // 12: 관광지
  @override
  Future<List<TouristSpotDetail>> getTouristSpotDetail(
      String contentId, String contentTypeId) async {
    // TODO: implement getTouristSpotDetail
    throw UnimplementedError();
  }

  // 반복 정보 조회 - 컨텐츠 별 (detail info - content detail info)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠)
  // 25: 여행 코스
  @override
  Future<List<CourseDetailInfo>> getCourseDetailInfo(
      String contentId, String contentTypeId) async {
    // TODO: implement getCourseDetailInfo
    throw UnimplementedError();
  }

  // 14: 문화 시설
  @override
  Future<List<CultureLocationDetailInfo>> getCultureLocationDetailInfo(
      String contentId, String contentTypeId) async {
    // TODO: implement getCultureLocationDetailInfo
    throw UnimplementedError();
  }

  // 15: 축제 공연 행사
  @override
  Future<List<FestivalDetailInfo>> getFestivalDetailInfo(
      String contentId, String contentTypeId) async {
    // TODO: implement getFestivalDetailInfo
    throw UnimplementedError();
  }

  // 28: 레포츠
  @override
  Future<List<LeportsDetailInfo>> getLeportsDetailInfo(
      String contentId, String contentTypeId) async {
    // TODO: implement getLeportsDetailInfo
    throw UnimplementedError();
  }

  // 12: 관광지
  @override
  Future<List<TouristSpotDetailInfo>> getTouristSpotDetailInfo(
      String contentId, String contentTypeId) async {
    // TODO: implement getTouristSpotDetailInfo
    throw UnimplementedError();
  }
}

void main() async {
  final test = await TourInfoRepositoryImpl(tourInfoDataSource: TourInfoDataSourceImpl()).getAreaBasedList();
  test.forEach(print);
}
