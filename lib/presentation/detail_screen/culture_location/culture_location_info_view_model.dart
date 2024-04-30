import 'package:flutter/cupertino.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class CultureLocationInfoViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;

  CultureLocationInfoViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  bool _isLoading = false;
  List<TourDetail> _tourDetailData = [];
  List<CultureLocationDetail> _CultureLocationDetailData = [];
  List<CultureLocationDetailInfo> _CultureLocationInfoData = [];

  bool get isLoading => _isLoading;
  List<TourDetail> get tourDetailData => _tourDetailData;
  List<CultureLocationDetail> get CultureLocationDetailData =>
      _CultureLocationDetailData;
  List<CultureLocationDetailInfo> get CultureLocationInfoData =>
      _CultureLocationInfoData;

  Future<void> getCultureLocationData(int id, int contentTypeId) async {
    _isLoading = true;
    notifyListeners();

    _tourDetailData = await _tourInfoRepository.getDetailCommon(id: id);
    print(_tourDetailData);
    _CultureLocationDetailData = await _tourInfoRepository
        .getCultureLocationDetail(id: id, contentTypeId: contentTypeId);

    _CultureLocationInfoData = await _tourInfoRepository
        .getCultureLocationDetailInfo(id: id, contentTypeId: contentTypeId);

    _isLoading = false;
    notifyListeners();
  }
}
