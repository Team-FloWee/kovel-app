import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';

class CourseInfoViewModel with ChangeNotifier {
  TourInfoRepository _tourInfoRepository;

  CourseInfoViewModel({required TourInfoRepository tourInfoRepository})
      : _tourInfoRepository = tourInfoRepository;

  List<TourDetail> _tourDetailData = [];
  List<TourDetail> get tourDetailData => _tourDetailData;
  List<CourseDetail> _courseDetailData = [];
  List<CourseDetail> get courseDetailData => _courseDetailData;
  List<CourseDetailInfo> _courseDetailInfoData = [];
  List<CourseDetailInfo> get courseDetailInfoData => _courseDetailInfoData;

  void fetchCourseData(int id, int contentTypeId) async {
    _tourDetailData = await _tourInfoRepository.getDetailCommon(id: id);
    _courseDetailData = await _tourInfoRepository.getCourseDetail(id: id, contentTypeId: contentTypeId);
    _courseDetailInfoData = await _tourInfoRepository.getCourseDetailInfo(id: id, contentTypeId: contentTypeId);
    notifyListeners();

    // 코스 반복정보 이미지 불러오기
    for (int i = 0; i < _courseDetailInfoData.length; i++) {
      if (_courseDetailInfoData[i].imagePath == '') {
        String imagePath = '';
        imagePath = (await _tourInfoRepository.getDetailCommon(id: _courseDetailInfoData[i].subContentId)).first.imagePath;
        _courseDetailInfoData[i] = _courseDetailInfoData[i]
            .copyWith(imagePath: imagePath);
      }
    }
    notifyListeners();
  }

  Future<String> getRelatedCourseImage(int id) async {
    final data = await _tourInfoRepository.getDetailCommon(id: id);
    return data.first.imagePath;
  }
}