import 'package:flutter/cupertino.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class CultureLocationInfoViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;

  CultureLocationInfoViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  List<TourDetail> _tourDetailData = [];
  List<CultureLocationDetail> _CultureLocationDetailData = [];
  List<CultureLocationDetailInfo> _CultureLocationInfoData = [];

  List<TourDetail> get tourDetailData => _tourDetailData;
  List<CultureLocationDetail> get CultureLocationDetailData =>
      _CultureLocationDetailData;
  List<CultureLocationDetailInfo> get CultureLocationInfoData =>
      _CultureLocationInfoData;

  Future<void> getCultureLocationData(Tour tour) async {
    _tourDetailData = await _tourInfoRepository.getDetailCommon(
        contentId: tour.id.toString());

    _CultureLocationDetailData =
        await _tourInfoRepository.getCultureLocationDetail(
            contentId: tour.id.toString(),
            contentTypeId: tour.contentTypeId.toString());

    _CultureLocationInfoData =
        await _tourInfoRepository.getCultureLocationDetailInfo(
            contentId: tour.id.toString(),
            contentTypeId: tour.contentTypeId.toString());
  }
}
