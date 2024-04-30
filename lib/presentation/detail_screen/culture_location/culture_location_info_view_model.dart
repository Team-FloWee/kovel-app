import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';
import 'package:kovel_app/presentation/components/icon_text_row.dart';

class CultureLocationInfoViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;

  CultureLocationInfoViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  bool _isLoading = true;
  List<Widget> widgets = [];
  List<TourDetail> _tourDetailData = [];
  List<CultureLocationDetail> _cultureLocationDetailData = [];
  List<CultureLocationDetailInfo> _cultureLocationInfoData = [];

  // Map<String, dynamic> mockdata = CultureLocationDetail(
  //     contentId: 129854,
  //     contentTypeId: 14,
  //     infoCenter: "02-720-1020",
  //     useFee: " 전시마다 상이",
  //     useTime: "",
  //     restDay: "월요일",
  //     parking: "",
  //     spendTime: "",
  //     petAllowed: "불가") as Map<String, dynamic>;

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
    showDetailData();
    notifyListeners();
  }

  void showDetailData() async {
    Map<String, dynamic> detailData =
        jsonDecode(jsonEncode(_cultureLocationDetailData.first));

    detailData.forEach((key, value) {
      if (value != null &&
          value != '' &&
          key != 'contentId' &&
          key != 'contentTypeId') {
        widgets.add(
          IconTextRow(
            icon: Icons.phone,
            text: value.toString(),
          ),
        );
      }
    });
  }
}
