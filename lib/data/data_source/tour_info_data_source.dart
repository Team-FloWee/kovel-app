import 'package:kovel_app/data/dto/tour_location_dto.dart';

abstract interface class TourInfoDataSource {
  Future<List<TourLocationDto>> getAreaBasedList();
  Future<List<TourLocationDto>> getSearchKeyword(String keyword);
  Future<List<TourLocationDto>> getSearchFestival(String eventStartDate);
  Future<List<TourLocationDto>> getLocationBasedList(String mapX, String mapY, String radius);
  Future<List<TourLocationDto>> getSearchStay();

  Future<dynamic> getDetailCommon(String contentId, String contentTypeId);
  Future<dynamic> getDetailIntro(String contentId, String contentTypeId);
  Future<dynamic> getDetailInfo(String contentId, String contentTypeId);
}
