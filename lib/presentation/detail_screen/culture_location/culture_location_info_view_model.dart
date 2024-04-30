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

  bool _isLoading = true;
  List<TourDetail> _tourDetailData = [];
  List<CultureLocationDetail> _cultureLocationDetailData = [];
  List<CultureLocationDetailInfo> _cultureLocationInfoData = [];

  bool get isLoading => _isLoading;
  List<TourDetail> get tourDetailData => _tourDetailData;
  List<CultureLocationDetail> get cultureLocationDetailData =>
      _cultureLocationDetailData;
  List<CultureLocationDetailInfo> get cultureLocationInfoData =>
      _cultureLocationInfoData;

  Future<void> getCultureLocationData(int id, int contentTypeId) async {
    _isLoading = true;
    notifyListeners();
    _tourDetailData = await _tourInfoRepository.getDetailCommon(id: id);
    _cultureLocationDetailData = await _tourInfoRepository
        .getCultureLocationDetail(id: id, contentTypeId: contentTypeId);
    _cultureLocationInfoData = await _tourInfoRepository
        .getCultureLocationDetailInfo(id: id, contentTypeId: contentTypeId);

    _isLoading = false;
    notifyListeners();
  }
}
