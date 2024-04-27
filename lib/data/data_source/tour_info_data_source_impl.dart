import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source.dart';
import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/data/dto/tour_dto.dart';

class TourInfoDataSourceImpl implements TourInfoDataSource {
  final _dio = Dio();
  final _mobileOs = 'AND'; // TODO: Core에 Enum으로 만들 예정

  // 지역기반 관광정보조회(areaBasedList1)
  @override
  Future<List<TourDto>> getAreaBasedList() async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL'); // TODO: 전역으로 생성할 방법이 있을까?
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'areaBasedList1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => TourDto.fromJson(e)).toList();
  }

  // 위치기반 관광정보조회
  @override
  Future<List<TourDto>> getLocationBasedList(String mapX, String mapY, String radius) async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'locationBasedList1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&mapX=$mapX&mapY=$mapY&radius=$radius&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => TourDto.fromJson(e)).toList();
  }

  // 행사정보조회
  @override
  Future<List<TourDto>> getSearchFestival(String eventStartDate) async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'searchFestival1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&eventStartDate=$eventStartDate&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => TourDto.fromJson(e)).toList();
  }

  // 키워드 검색 조회
  @override
  Future<List<TourDto>> getSearchKeyword(String keyword) async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'searchKeyword1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&keyword=$keyword&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => TourDto.fromJson(e)).toList();
  }

  // 숙박정보조회
  @override
  Future<List<TourDto>> getSearchStay() async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'searchStay1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => TourDto.fromJson(e)).toList();
  }

  // 공통정보조회
  @override
  Future<List<TourDetailDto>> getDetailCommon(String contentId) async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'detailCommon1';

    Response response;
    response =
        await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&contentId=$contentId&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => TourDetailDto.fromJson(e)).toList();
  }

  // 소개정보조회
  @override
  Future<List<ContentDetailDto>> getDetailIntro(String contentId, String contentTypeId) async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'detailIntro1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&contentId=$contentId&contentTypeId=$contentTypeId&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => ContentDetailDto.fromJson(e)).toList();
  }

  // 반복정보조회
  @override
  Future<List<ContentDetailInfoDto>> getDetailInfo(String contentId, String contentTypeId) async {
    await dotenv.load();
    final String baseUrl = dotenv.get('Base_URL');
    final String key = dotenv.get('TOUR_API_KEY');
    const String apiName = 'detailInfo1';

    final Response response;
    response = await _dio.get('$baseUrl/$apiName?MobileOS=$_mobileOs&MobileApp=MobileApp&_type=json&contentId=$contentId&contentTypeId=$contentTypeId&serviceKey=$key');

    final List tourInfoList = response.data['response']['body']['items']['item'];
    return tourInfoList.map((e) => ContentDetailInfoDto.fromJson(e)).toList();
  }
}
