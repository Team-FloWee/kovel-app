import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class CourseListViewModel with ChangeNotifier {
  final TourInfoRepository _tourInfoRepository;
  bool _isloading = true;

  bool get isloading => _isloading;

  final List<int> mockData = [
    2361026,
    1885246,
    2680214,
    1968165,
    1949308,
    1908287,
    2514870,
    2916281,
    2677792,
    2619120,
  ];

  CourseListViewModel({
    required TourInfoRepository tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;

  //소개정보
  List<CourseDetail> _CourseDetailData = [];

  List<CourseDetail> get CourseDetailData => _CourseDetailData;

  //공통정보
  List<TourDetail> _TourDetailData = [];

  List<TourDetail> get TourDetailData => _TourDetailData;

  List<CourseDetailInfo> _CourseDetailInfoData = [];

  List<CourseDetailInfo> get CourseDetailInfoData => _CourseDetailInfoData;

  Future<void> getCourseData() async {
    _isloading = true;
    notifyListeners();
    _TourDetailData.addAll(
        await _tourInfoRepository.getDetailCommon(id: 2361026));
    _TourDetailData.addAll(
        await _tourInfoRepository.getDetailCommon(id: 1885246));
    _TourDetailData.addAll(
        await _tourInfoRepository.getDetailCommon(id: 2680214));
    _TourDetailData.addAll(
        await _tourInfoRepository.getDetailCommon(id: 1968165));
    _TourDetailData.addAll(
        await _tourInfoRepository.getDetailCommon(id: 1949308));

    _isloading = false;

    notifyListeners();
  }
}
