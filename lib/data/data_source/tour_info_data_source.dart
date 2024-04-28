import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/data/dto/tour_dto.dart';

abstract interface class TourInfoDataSource {
  Future<List<TourDto>> getAreaBasedList([int? pageNo = 1]);
  Future<List<TourDto>> getLocationBasedList(String mapX, String mapY, String radius, [int? pageNo = 1]);
  Future<List<TourDto>> getSearchKeyword(String keyword, [int? pageNo = 1]);
  Future<List<TourDto>> getSearchFestival(String eventStartDate, [int? pageNo = 1]);
  Future<List<TourDto>> getSearchStay([int? pageNo = 1]);

  Future<List<TourDetailDto>> getDetailCommon(String contentId, [int? pageNo = 1]);
  Future<List<ContentDetailDto>> getDetailIntro(String contentId, String contentTypeId, [int? pageNo = 1]);
  Future<List<ContentDetailInfoDto>> getDetailInfo(String contentId, String contentTypeId, [int? pageNo = 1]);
}
