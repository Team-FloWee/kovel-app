import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';
import 'package:logger/logger.dart';

import '../../domain/model/tour.dart';
import '../../domain/use_case/get_area_data_use_case.dart';

class LocationListViewModel with ChangeNotifier {
  final GetCommonDataUseCase _getCommonDataUseCase;
  final GetAreaDataUseCase _getAreaDataUseCase;
  final UserRepository _userRepository;

  LocationListViewModel({
    required GetCommonDataUseCase getCommonDataUseCase,
    required GetAreaDataUseCase getAreaDataUseCase,
    required UserRepository userRepository,
  })  : _getCommonDataUseCase = getCommonDataUseCase,
        _getAreaDataUseCase = getAreaDataUseCase,
        _userRepository = userRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Tour> _areaBasedDataList = [];

  List<Tour> get areaBasedDataList => _areaBasedDataList;

  List<TourDetail> _courseDetailList = [];

  List<TourDetail> get courseDetailList => _courseDetailList;

  List<TourDetail> _tourDetailList = [];

  List<TourDetail> get tourDetailList => _tourDetailList;

  int get contentTypeId => 0;

  // 추천 코스 페이지네이션에 사용되는 페이지 변수
  int _coursePageNo = 1;

  // 추천 코스 전체 데이터 로딩과 페이지네이션 로딩 처리 분리 변수
  bool _isCourseDataLoading = false;

  bool get isCourseDataLoading => _isCourseDataLoading;

  // 테마별 장소 페이지네이션에 사용되는 페이지 변수
  int _commonPageNo = 1;

  // 테마별 장소 전체 데이터 로딩과 페이지네이션 로딩 처리 분리 변수
  bool _isCommonDataLoading = false;

  bool get isCommonDataLoading => _isCommonDataLoading;

  int? _selectedCategory;

  int? get selectedCategory => _selectedCategory;

  String? _selectedCourseCategory;

  String? get selectedCourseCategory => _selectedCourseCategory;

  //서울 areacode에 있는 contentTypeId :25(여행정보)의 contentId를 받아와야 함
  //추천코스 [전체]
  Future<void> getData(String areaCode) async {
    _isLoading = true;
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: '', contentTypeId: 25);

    await Future.wait(_areaBasedDataList.map((element) async {
      _courseDetailList.add(await _getCommonDataUseCase.execute(id: element.id));
    }));

    notifyListeners();

    await getCommonData(areaCode, contentTypeId);
    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseData(String areaCode, String cat2) async {
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: cat2, contentTypeId: 25);

    _courseDetailList = [];
    await Future.wait(_areaBasedDataList.map((element) async {
      _courseDetailList.add(await _getCommonDataUseCase.execute(id: element.id));
    }));
    notifyListeners();
  }

  //테마별 여행 [전체]
  Future<void> getCommonData(String areaCode, int contentTypeId) async {
    //_isLoading = true;
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: '', contentTypeId: contentTypeId);

    _tourDetailList = [];

    await Future.wait(_areaBasedDataList.map((element) async {
      _tourDetailList.add(await _getCommonDataUseCase.execute(id: element.id));
    }));
    notifyListeners();

    //_isLoading = false;
    notifyListeners();
  }

  // 테마별 장소 페이지네이션
  void fetchMoreCommonData(String areaCode) async {
    _isCommonDataLoading = true;
    notifyListeners();

    _areaBasedDataList = [];
    _areaBasedDataList.addAll((await _getAreaDataUseCase.execute(
        areaCode: areaCode,
        cat2: '',
        contentTypeId: _selectedCategory ?? 0,
        pageNo: ++_commonPageNo)));

    await Future.wait(_areaBasedDataList.map((element) async {
      _tourDetailList.add(await _getCommonDataUseCase.execute(id: element.id));
    }));
    notifyListeners();

    _isCommonDataLoading = false;
    notifyListeners();
  }

  // 추천코스 페이지네이션
  void fetchMoreCourseData(String areaCode) async {
    _isCourseDataLoading = true;
    notifyListeners();

    _areaBasedDataList = [];
    _areaBasedDataList.addAll((await _getAreaDataUseCase.execute(
        areaCode: areaCode,
        cat2: _selectedCourseCategory ?? '',
        contentTypeId: 25,
        pageNo: ++_coursePageNo)));

    await Future.wait(_areaBasedDataList.map((element) async {
      _courseDetailList
          .add(await _getCommonDataUseCase.execute(id: element.id));
    }));
    notifyListeners();

    _isCourseDataLoading = false;
    notifyListeners();
  }

  void selectCategory(int category) {
    _selectedCategory = category;

    // 카테고리를 선택하면 변수를 초기화
    _commonPageNo = 1;
    _tourDetailList = [];

    Logger().i('viewModel -> _selectedCategory  $_selectedCategory');
    notifyListeners();
  }

  // 코스 카테고리 선택 시
  void selectCourseCategory(String courseCategory) {
    _selectedCourseCategory = courseCategory;

    // 카테고리를 선택하면 변수를 초기화
    _coursePageNo = 1;
    _courseDetailList = [];

    notifyListeners();
  }
}
