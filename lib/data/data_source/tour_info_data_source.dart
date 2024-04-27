import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/data/dto/tour_dto.dart';

abstract interface class TourInfoDataSource {
  Future<List<TourDto>> getAreaBasedList();
  Future<List<TourDto>> getSearchKeyword(String keyword);
  Future<List<TourDto>> getSearchFestival(String eventStartDate);
  Future<List<TourDto>> getLocationBasedList(String mapX, String mapY, String radius);
  Future<List<TourDto>> getSearchStay();

  Future<List<TourDetailDto>> getDetailCommon(String contentId);
  Future<List<ContentDetailDto>> getDetailIntro(String contentId, String contentTypeId);
  Future<List<ContentDetailInfoDto>> getDetailInfo(String contentId, String contentTypeId);
}
