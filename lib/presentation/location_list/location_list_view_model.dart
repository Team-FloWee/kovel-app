import 'dart:core';

import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

import '../../domain/model/tour.dart';
import '../../domain/repository/tour_info_repository.dart';

class LocationListViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  LocationListViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  List<Tour> _areaBasedDataList = [];

  List<Tour> get areaBasedDataList => _areaBasedDataList;

  List<TourDetail> _courseDetail = [];

  List<TourDetail> get courseDetail => _courseDetail;

  List<TourDetail> _tourDetail = [];

  List<TourDetail> get tourDetail => _tourDetail;

  int get contentTypeId => 0;

  //서울 areacode에 있는 contentTypeId :25(여행정보)의 contentId를 받아와야 함
  //contentTypeId도 필요합니다.(관광지/ 음식점...등등)

  //추천코스 [전체]
  Future<void> getData(String areaCode) async {
    _isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(areaCode:areaCode,contentTypeId: 25);

    _areaBasedDataList.forEach((element) async {
      _courseDetail.addAll(await _tourInfoRepository.getDetailCommon(id: element.id));
    }); //이렇게 쓰면 ID 리스트 필요없을 거 같음

    notifyListeners();
    await getCommonData(areaCode, contentTypeId);
    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseData(String areaCode, String cat2) async {
    //_isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(contentTypeId: 25, areaCode: areaCode, cat2: cat2);
    _courseDetail = [];
    _areaBasedDataList.forEach((element) async {
      _courseDetail.add((await _tourInfoRepository.getDetailCommon(id: element.id)).first);
      notifyListeners();
    });
    //_isLoading = false;
    notifyListeners();
  }

  //테마별 여행 [전체]
  Future<void> getCommonData(String areaCode, int contentTypeId) async {
    //_isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(areaCode: areaCode, contentTypeId: contentTypeId);
    _tourDetail = [];
    _areaBasedDataList.forEach((element) async {
      _tourDetail.add((await _tourInfoRepository.getDetailCommon(id: element.id)).first);
      notifyListeners();
    });
    //_isLoading = false;
    notifyListeners();
  }
}