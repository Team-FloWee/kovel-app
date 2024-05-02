import 'dart:core';

import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

import '../../domain/model/tour.dart';
import '../../domain/repository/tour_info_repository.dart';

class LocationListViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isFavorite = false;

  int _areaCode = 1; //서울, 경기...

  LocationListViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  List<Tour> _areaBasedDataList = [];

  List<Tour> get areaBasedDataList => _areaBasedDataList;

  List<TourDetail> _courseDetail = [];

  List<TourDetail> get courseDetail => _courseDetail;

  List<TourDetail> _tourDetail = [];

  List<TourDetail> get tourDetail => _tourDetail;

  //서울 areacode에 있는 contentTypeId :25(여행정보)의 contentId를 받아와야 함
  //contentTypeId도 필요합니다.(관광지/ 음식점...등등)

  //추천코스 [전체]
  Future<void> getCourseData() async {
    _isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(contentTypeId: 25);
    List<int> idList = _areaBasedDataList.map((e) => e.id).toList();
    idList.forEach((e) async {
      (_courseDetail.addAll(await _tourInfoRepository.getDetailCommon(id: e)));
      notifyListeners();
    });
    await getDetailCommon();
    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }

  //테마별 여행 [전체]
  Future<void> getDetailCommon() async {
    _isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(areaCode: '1');
    List<int> idList = _areaBasedDataList.map((e) => e.id).toList();
    idList.forEach((e) async {
      (_tourDetail.addAll(await _tourInfoRepository.getDetailCommon(id: e)));
      notifyListeners();
    });
    _isLoading = false;
    notifyListeners();
  }
}
