import 'package:kovel_app/data/dto/tour_location_dto.dart';
import 'package:kovel_app/data/mapper/tour_location_mapper.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

import '../../domain/model/tour_location.dart';

class TourInfoRepositoryImpl implements TourInfoRepository {
  final TourInfoDataSource _tourInfoDataSource;

  TourInfoRepositoryImpl({
    required TourInfoDataSource tourInfoDataSource,
  }) : _tourInfoDataSource = tourInfoDataSource;

  // 지역 기반 관광 정보 조회 (area based list)
  @override
  Future<List<TourLocation>> getAreaBasedList() async {
    final List<TourLocationDto> tourLocationDto =
        await _tourInfoDataSource.getAreaBasedListDto();
    return tourLocationDto.map((e) => e.toTourLocation()).toList();
  }

  // 키워드 검색 조회 (search keyword)
  @override
  Future<List<TourLocation>> getSearchKeyword(String query) async {
    final List<TourLocationDto> tourLocationDto =
        await _tourInfoDataSource.getSearchKeyword();
    return tourLocationDto.map((e) => e.toTourLocation()).toList();
  }

  // 위치 기반 관광 정보 조회 (location based list)
  @override
  Future<List<TourLocation>> getLocationBasedList() async {
    final List<TourLocationDto> tourLocationDto =
        await _tourInfoDataSource.getLocationBasedList();
    return tourLocationDto.map((e) => e.toTourLocation()).toList();
  }

  // 소개 정보 조회 (detail intro)
  @override
  Future<List<dynamic>> getDetailIntro() async {
    // return await _tourInfoDataSource.toTourLocation();
    // TODO: implement getDetailInfo
    throw UnimplementedError();
  }

  // 반복 정보 조회 (detail info)
  @override
  Future<List<dynamic>> getDetailInfo() async {
    // TODO: implement getDetailInfo
    throw UnimplementedError();
  }
}

void main() {}
