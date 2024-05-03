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
  final String areaCode;

  List<String> textdata = [
    '전체',
    'C0112',
    'C0113',
    'C0114',
    'C0115',
    'C0116',
    'C0117',
  ];

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<Tour> _tourList = [];

  List<Tour> get tourList => _tourList;

  CourseListViewModel({
    required TourInfoRepository tourInfoRepository,
    required this.areaCode,
  }) : _tourInfoRepository = tourInfoRepository;

  List<TourDetail> get courseDetail => _courseDetail;

  List<TourDetail> get TourDetailData => _TourDetailData;

  Future<void> getCourseData() async {
    _isLoading = true;
    notifyListeners();

    _tourList = await _tourInfoRepository.getAreaBasedList(areaCode: '1', contentTypeId: 25);

    List<int> tourIdList = _tourList.map((e) => e.id).toList();

    tourIdList.forEach((e) async {
      _TourDetailData.addAll(await _tourInfoRepository.getDetailCommon(id: e));
      notifyListeners();
    });

    _isLoading = false;
    notifyListeners();
  }

  dynamic onTapCourseData(String text) async {
    _isLoading = true;
    notifyListeners();

    _TourDetailData = [];

    _tourList = await _tourInfoRepository.getAreaBasedList(areaCode: '1', contentTypeId: 25, cat2: text);

    List<int> tourIdList = _tourList.map((e) => e.id).toList();
    tourIdList.forEach((e) async {
      _TourDetailData.addAll(await _tourInfoRepository.getDetailCommon(id: e));
      notifyListeners();
    });

    _isLoading = false;
    notifyListeners();
  }
}
