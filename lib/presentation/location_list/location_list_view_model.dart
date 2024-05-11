import 'dart:convert';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';

import '../../domain/model/archived.dart';
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
  bool _isArchived = false;
  late List<Archived> decodedData;
  List<Archived> archivedList = [];
  List<String> stringList = [];
  late User _user;
  List<Tour> _areaBasedDataList = [];
  List<TourDetail> _courseDetailList = [];
  List<TourDetail> _tourDetailList = [];

  bool get isLoading => _isLoading;
  bool get isArchived => _isArchived;
  List<Tour> get areaBasedDataList => _areaBasedDataList;
  List<TourDetail> get courseDetailList => _courseDetailList;
  List<TourDetail> get tourDetailList => _tourDetailList;

  int get contentTypeId => 0;

  //서울 areacode에 있는 contentTypeId :25(여행정보)의 contentId를 받아와야 함
  //추천코스 [전체]
  Future<void> getData(String areaCode) async {
    _isLoading = true;
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: '', contentTypeId: 25);
    _areaBasedDataList.forEach((element) async {
      _courseDetailList
          .add(await _getCommonDataUseCase.execute(id: element.id));
    }); //이렇게 쓰면 ID 리스트 필요없을 거 같음

    notifyListeners();
    await getCommonData(areaCode, contentTypeId);
    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseData(String areaCode, String cat2) async {
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: '', contentTypeId: 25);

    _courseDetailList = [];
    _areaBasedDataList.forEach((element) async {
      _courseDetailList
          .add((await _getCommonDataUseCase.execute(id: element.id)));
      notifyListeners();
    });
    notifyListeners();
  }

  //테마별 여행 [전체]
  Future<void> getCommonData(String areaCode, int contentTypeId) async {
    //_isLoading = true;
    notifyListeners();

    _areaBasedDataList = await _getAreaDataUseCase.execute(
        areaCode: areaCode, cat2: '', contentTypeId: contentTypeId);

    _tourDetailList = [];
    _areaBasedDataList.forEach((element) async {
      _tourDetailList
          .add((await _getCommonDataUseCase.execute(id: element.id)));
      notifyListeners();
    });
    //_isLoading = false;
    notifyListeners();
  }

  void getArchivedList() async {
    _user = await _userRepository.getUser(
        id: auth.FirebaseAuth.instance.currentUser!.uid);

    decodedData = (jsonDecode(_user.stringList.toString()) as List<dynamic>)
        .map((e) => Archived.fromJson(e))
        .toList();
  }

  void updateArchivedList(Archived clickedArchived) async {
    notifyListeners();
    print('유저아이디${_user}');
    if (_isArchived == false) {
      decodedData.add(clickedArchived);
      String data = jsonEncode(decodedData);
      await _userRepository.saveArchivedList(user: _user, data: data);
      !_isArchived;
    } else {
      decodedData.removeWhere((archived) => archived.id == clickedArchived.id);
      String data = jsonEncode(decodedData);
      await _userRepository.deleteArchivedList(user: _user, data: data);
      !_isArchived;
    }
    notifyListeners();
  }
}
