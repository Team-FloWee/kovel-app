import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source.dart';
import 'package:kovel_app/data/dto/tour_location_dto.dart';

class TourInfoDataSourceImpl implements TourInfoDataSource {
  // 지역기반 관광정보조회(areaBasedList1)
  final dio = Dio();
  final _modileOs = 'AND'; // TODO: Core에 Enum으로 만들 예정

  @override
  //Future<List<TourLocationDto>> getAreaBasedList() async {
  void getAreaBasedList() async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL'); // TODO: 전역으로 생성할 방법이 있을까?
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'areaBasedList1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&serviceKey=$key');

    print(response.data);
  }

  @override
  //Future<List<TourLocationDto>> getLocationBasedList(String mapX, String mapY, String radius) async {
  void getLocationBasedList(String mapX, String mapY, String radius) async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'locationBasedList1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&mapX=$mapX&mapY=$mapY&radius=$radius&serviceKey=$key');
    print(response.data['response']['body']['items']['item']);
  }

  @override
  //Future<List<TourLocationDto>> getSearchFestival() async {
  void getSearchFestival(String eventStartDate) async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'searchFestival1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&eventStartDate=$eventStartDate&serviceKey=$key');
    print(response.data['response']['body']['items']['item']);
  }

  @override
  //Future<List<TourLocationDto>> getSearchKeyword(String keyword) async {
  void getSearchKeyword(String keyword) async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'searchKeyword1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&keyword=$keyword&serviceKey=$key');
    print(response.data['response']['body']['items']['item']);
  }

  @override
  // Future<List<TourLocationDto>> getSearchStay() async {
  void getSearchStay() async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'searchStay1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&serviceKey=$key');
    print(response.data['response']['body']['items']['item']);
  }

  @override
  Future<dynamic> getDetailIntro(String contentId, String contentTypeId) async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'detailIntro1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&contentId=$contentId&contentTypeId=$contentTypeId&serviceKey=$key');
    print(response.data);
  }

  @override
  //Future<List> getDetailInfo() async {
  void getDetailInfo(String contentId, String contentTypeId) async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'detailInfo1';

    Response response;
    response = await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&contentId=$contentId&contentTypeId=$contentTypeId&serviceKey=$key');
    print(response.data);
  }

  @override
  Future getDetailCommon(String contentId, String contentTypeId) async {
    await dotenv.load();
    String baseUrl = dotenv.get('Base_URL');
    String key = dotenv.get('TOUR_API_KEY');
    String apiName = 'detailCommon1';

    Response response;
    response =
        await dio.get('$baseUrl/$apiName?MobileOS=$_modileOs&MobileApp=MobileApp&_type=json&contentId=$contentId&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&serviceKey=$key');
    print(response.data);
  }
}

main() {
  //TourInfoDataSourceImpl().getAreaBasedList();
  //TourInfoDataSourceImpl().getLocationBasedList('127.7130161606', '37.9167408445', '500');
  // TourInfoDataSourceImpl().getSearchFestival('20240401');
  // TourInfoDataSourceImpl().getSearchStay();
  // TourInfoDataSourceImpl().getDetailCommon('132248');
  // TourInfoDataSourceImpl().getDetailIntro('3111770', '15');
  TourInfoDataSourceImpl().getDetailInfo('2384832', '25');
}
