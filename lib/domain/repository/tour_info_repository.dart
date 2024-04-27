import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail.dart';
import 'package:kovel_app/domain/model/detail/lodgment/lodgment_detail.dart';
import 'package:kovel_app/domain/model/detail/restaurant/restaurant_detail.dart';
import 'package:kovel_app/domain/model/detail/shopping/shopping_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail.dart';

import '../model/detail/culture_location/culture_location_detail_info.dart';
import '../model/detail/festival/festival_detail_info.dart';
import '../model/detail/leports/leports_detail_info.dart';
import '../model/detail/tourist_spot/tourist_spot_detail_info.dart';
import '../model/tour.dart';

abstract interface class TourInfoRepository {
  // 지역 기반 관광 정보 조회 (area based list)
  Future<List<Tour>> getAreaBasedList();

  // 키워드 검색 조회 (search keyword)
  Future<List<Tour>> getSearchKeyword(String keyword);

  // 위치 기반 관광 정보 조회 (location based list)
  Future<List<Tour>> getLocationBasedList(
      String mapX, String mapY, String radius);

  // 축제 공연 행사 검색 조회 (search Festival)
  Future<List<Tour>> getSearchFestival(String eventStartDate);

  // 숙박 검색 조회 (search stay)
  Future<List<Tour>> getSearchStay();

  // 공통 정보 조회 (tour detail)
  Future<List<TourDetail>> getDetailCommon(String contentId);

  // 소개 정보 조회 - 컨텐츠 별 (content detail)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점)
  // 25: 여행 코스
  Future<List<CourseDetail>> getCourseDetail(String contentId, String contentTypeId);

  // 14: 문화 시설
  Future<List<CultureLocationDetail>> getCultureLocationDetail(String contentId, String contentTypeId);

  // 15: 축제 공연 행사
  Future<List<FestivalDetail>> getFestivalDetail(String contentId, String contentTypeId);

  // 28: 레포츠
  Future<List<LeportsDetail>> getLeportsDetail(String contentId, String contentTypeId);

  // 32: 숙박
  Future<List<LodgmentDetail>> getLodgmentDetail(String contentId, String contentTypeId);

  // 39: 음식점
  Future<List<RestaurantDetail>> getRestaurantDetail(String contentId, String contentTypeId);

  // 38: 쇼핑
  Future<List<ShoppingDetail>> getShoppingDetail(String contentId, String contentTypeId);

  // 12: 관광지
  Future<List<TouristSpotDetail>> getTouristSpotDetail(String contentId, String contentTypeId);

  // 반복 정보 조회 - 컨텐츠 별 (content detail info)
  // (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠)
  // 25: 여행 코스
  Future<List<CourseDetailInfo>> getCourseDetailInfo(String contentId, String contentTypeId);

  // 14: 문화 시설
  Future<List<CultureLocationDetailInfo>> getCultureLocationDetailInfo(String contentId, String contentTypeId);

  // 15: 축제 공연 행사
  Future<List<FestivalDetailInfo>> getFestivalDetailInfo(String contentId, String contentTypeId);

  // 28: 레포츠
  Future<List<LeportsDetailInfo>> getLeportsDetailInfo(String contentId, String contentTypeId);

  // 12: 관광지
  Future<List<TouristSpotDetailInfo>> getTouristSpotDetailInfo(String contentId, String contentTypeId);
}
