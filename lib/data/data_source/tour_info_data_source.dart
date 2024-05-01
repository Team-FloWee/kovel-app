import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/data/dto/tour_dto.dart';

abstract interface class TourInfoDataSource {
  Future<List<TourDto>> getAreaBasedList({int pageNo = 1});
  Future<List<TourDto>> getLocationBasedList({required String mapX, required String mapY, required String radius, int pageNo = 1});
  Future<List<TourDto>> getSearchKeyword({required String keyword, int pageNo = 1});
  Future<List<TourDto>> getSearchFestival({required String eventStartDate, required String eventEndDate, int pageNo = 1});
  Future<List<TourDto>> getSearchStay({int? pageNo = 1});

  Future<List<TourDetailDto>> getDetailCommon({required int id, int pageNo = 1});
  Future<List<ContentDetailDto>> getDetailIntro({required int id, required int contentTypeId, int pageNo = 1});
  Future<List<ContentDetailInfoDto>> getDetailInfo({required int id, required int contentTypeId, int pageNo = 1});
}
