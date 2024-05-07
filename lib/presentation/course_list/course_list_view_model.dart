import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/category/course_category_type.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/tour.dart';

import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class CourseListViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;

  String code = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final bool _isFavorite = false;

  final int _areaCode = 1; //서울, 경기...

  CourseListViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  List<Tour> _areaBasedDataList = [];

  List<Tour> get areaBasedDataList => _areaBasedDataList;

  List<TourDetail> _courseDetail = [];

  List<TourDetail> get courseDetail => _courseDetail;

  final List<TourDetail> _tourDetail = [];

  List<TourDetail> get tourDetail => _tourDetail;

  int get contentTypeId => 0;

  Future<void> getData(String areaCode) async {
    // 지역기반조회 컨텐트 아이디 25 넣고 -> 공통정보조회에 아이디 넣고 -> getCommonData
    _isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(contentTypeId: 25);

    _areaBasedDataList.forEach((element) async {
      _courseDetail.addAll(await _tourInfoRepository.getDetailCommon(id: element.id));
    });

    notifyListeners();
    await getCommonData(areaCode, contentTypeId);

    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseData(String areaCode, String cat2) async {
    // 지역기반조회 지역, 카테고리 받고 -> 공통정보조회 아이디 받음.
    // _isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(contentTypeId: 25, areaCode: areaCode, cat2: cat2);
    _courseDetail = [];
    _areaBasedDataList.forEach((element) async {
      _courseDetail.addAll(await _tourInfoRepository.getDetailCommon(id: element.id));
      notifyListeners();
    });
    // _isLoading = false;
    notifyListeners();
  }

  Future<void> getCommonData(String areaCode, int contentTypeId) async {
    // 지역코드, 컨텐트타입아이디 받고 지역기반조회에 넣고 아이디를 받아 공통정보조회에 넣음 .

    // _isLoading = true;
    notifyListeners();
    _areaBasedDataList = await _tourInfoRepository.getAreaBasedList(areaCode: areaCode, contentTypeId: contentTypeId);

    _areaBasedDataList.forEach((element) async {
      _tourDetail.addAll(await _tourInfoRepository.getDetailCommon(id: element.id));
      notifyListeners();
    });
    print(_tourDetail);
    // _isLoading = false;
    notifyListeners();
  }
}
