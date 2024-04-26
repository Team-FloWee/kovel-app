import '../model/tour_location.dart';

abstract interface class TourInfoRepository {
  // 지역 기반 관광 정보 조회 (area based list)
  Future<List<TourLocation>> getAreaBasedList();

  // 키워드 검색 조회 (search keyword)
  Future<List<TourLocation>> getSearchKeyword(String query);

  // 위치 기반 관광 정보 조회 (location based list)
  Future<List<TourLocation>> getLocationBasedList();

  // 소개 정보 조회 (detail intro)
  Future<List<dynamic>> getDetailIntro();

  // 반복 정보 조회 (detail info)
  Future<List<dynamic>> getDetailInfo();
}