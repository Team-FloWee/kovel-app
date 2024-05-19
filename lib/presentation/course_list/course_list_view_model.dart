import 'package:flutter/material.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_area_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';

class CourseListViewModel with ChangeNotifier {
  final GetAreaDataUseCase _getAreaDataUseCase;
  final GetCommonDataUseCase _getCommonDataUseCase;

  CourseListViewModel({
    required GetCommonDataUseCase getCommonDataUseCase,
    required GetAreaDataUseCase getAreaDataUseCase,
  })  : _getAreaDataUseCase = getAreaDataUseCase,
        _getCommonDataUseCase = getCommonDataUseCase;

  String code = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final bool _isFavorite = false;

  final int _areaCode = 1; //서울, 경기...
  //
  // Result<List<Tour>,NetworkError> _areaBasedDataList = Result.error(NetworkError.unknown);
  // Result<List<Tour>,NetworkError> get areaBasedDataList => _areaBasedDataList;

  List<TourDetail> _courseDetailList = [];

  List<TourDetail> get courseDetailList => _courseDetailList;

  final List<TourDetail> _tourDetail = [];

  List<TourDetail> get tourDetail => _tourDetail;

  int get contentTypeId => 0;

  Future<void> getData(String areaCode) async {
    // 지역기반조회 컨텐트 아이디 25 넣고 -> 공통정보조회에 아이디 넣고 -> getCommonData
    _isLoading = true;
    notifyListeners();
    final _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: '', contentTypeId: 25);

    switch (_areaBasedDataList) {
      case Success<List<Tour>, NetworkError>():
        await Future.wait(_areaBasedDataList.data.map((element) async {
          _courseDetailList
              .add(await _getCommonDataUseCase.execute(id: element.id));
        }));
      case Error<List<Tour>, NetworkError>():
        {
          switch (_areaBasedDataList.error) {
            case NetworkError.requestTimeout:
            //  TODO:
            case NetworkError.unknown:
            //    TODO
            case NetworkError.unauthorized:
            //TODO
            case NetworkError.notFound:
            //TODO
            case NetworkError.serverError:
            //TODO
          }
        }
        ;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseData(String areaCode, String cat2) async {
    // 지역기반조회 지역, 카테고리 받고 -> 공통정보조회 아이디 받음.
    // _isLoading = true;
    notifyListeners();
    final _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: cat2, contentTypeId: 25);
    _courseDetailList = [];
    switch (_areaBasedDataList) {
      case Success<List<Tour>, NetworkError>():
        await Future.wait(_areaBasedDataList.data.map((element) async {
          _courseDetailList
              .add(await _getCommonDataUseCase.execute(id: element.id));
        }));
      case Error<List<Tour>, NetworkError>():
        {
          switch (_areaBasedDataList.error) {
            case NetworkError.requestTimeout:
            //  TODO:
            case NetworkError.unknown:
            //    TODO
            case NetworkError.unauthorized:
            //TODO
            case NetworkError.notFound:
            //TODO
            case NetworkError.serverError:
            //TODO
          }
        }
        ;
    }
    // _isLoading = false;
    notifyListeners();
  }
}
