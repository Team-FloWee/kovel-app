import 'dart:core';

import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';

import '../../domain/model/tour.dart';
import '../../domain/repository/tour_info_repository.dart';
import '../../domain/use_case/get_area_data_use_case.dart';

class LocationListViewModel with ChangeNotifier {
  final GetCommonDataUseCase _getCommonDataUseCase;
  final GetAreaDataUseCase _getAreaDataUseCase;

  LocationListViewModel({
    required GetCommonDataUseCase getCommonDataUseCase,
    required GetAreaDataUseCase getAreaDataUseCase,
  })
      : _getCommonDataUseCase = getCommonDataUseCase,
        _getAreaDataUseCase = getAreaDataUseCase;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Tour> _areaBasedDataList = [];
  List<Tour> get areaBasedDataList => _areaBasedDataList;

  List<TourDetail> _courseDetailList = [];
  List<TourDetail> get courseDetailList => _courseDetailList;

  List<TourDetail> _tourDetailList = [];
  List<TourDetail> get tourDetailList => _tourDetailList;


  int get contentTypeId => 0;

  //서울 areacode에 있는 contentTypeId :25(여행정보)의 contentId를 받아와야 함
  //추천코스 [전체]
  Future<void> getData(String areaCode) async {
    _isLoading = true;
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(areaCode: areaCode, cat2: '', contentTypeId: 25);
    _areaBasedDataList.forEach((element) async {
      _courseDetailList.add(
          await _getCommonDataUseCase.execute(id: element.id));
    }); //이렇게 쓰면 ID 리스트 필요없을 거 같음

    notifyListeners();
    await getCommonData(areaCode, contentTypeId);
    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseData(String areaCode, String cat2) async {
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(areaCode: areaCode, cat2: '', contentTypeId: 25);

    _courseDetailList = [];
    _areaBasedDataList.forEach((element) async {
      _courseDetailList.add(
          (await _getCommonDataUseCase.execute(id: element.id)));
      notifyListeners();
    });
    notifyListeners();
  }

  //테마별 여행 [전체]
  Future<void> getCommonData(String areaCode, int contentTypeId) async {
    //_isLoading = true;
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(areaCode: areaCode, cat2: '', contentTypeId: contentTypeId);

    _tourDetailList = [];
    _areaBasedDataList.forEach((element) async {
      _tourDetailList.add(
          (await _getCommonDataUseCase.execute(id: element.id)));
      notifyListeners();
    });
    //_isLoading = false;
    notifyListeners();
  }
}