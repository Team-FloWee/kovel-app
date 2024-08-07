import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/get_address_info_use_case.dart';
import 'package:kovel_app/domain/use_case/get_location_based_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_search_festival_use_case.dart';
import 'package:kovel_app/domain/use_case/get_top_ten_popular_tour_list_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final GetSearchFestivalUseCase _getSearchFestivalUseCase;
  final GetLocationBasedDataUseCase _getLocationBasedDataUseCase;
  final GetTopTenPopularTourListUseCase _getTopTenPopularTourListUseCase;
  final GetAddressInfoUseCase _getAddressInfoUseCase;

  HomeViewModel({
    required GetSearchFestivalUseCase getSearchFestivalUseCase,
    required GetLocationBasedDataUseCase getLocationBasedDataUseCase,
    required GetTopTenPopularTourListUseCase getTopTenPopularTourListUseCase,
    required GetAddressInfoUseCase getAddressInfoUseCase,
  })  : _getSearchFestivalUseCase = getSearchFestivalUseCase,
        _getLocationBasedDataUseCase = getLocationBasedDataUseCase,
        _getTopTenPopularTourListUseCase = getTopTenPopularTourListUseCase,
        _getAddressInfoUseCase = getAddressInfoUseCase;

  bool _popularLoading = false;
  bool _festivalLoading = false;
  bool get popularLoading => _popularLoading;
  bool get festivalLoading => _festivalLoading;
  bool isLoading = false;
  double? longitude;
  double? latitude;
  double distance = 0;
  String selectedLocation = '현재 위치'.tr();

  // User Profile

  final userRef = FirebaseFirestore.instance.collection('user').withConverter<User>(fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!), toFirestore: (snapshot, _) => snapshot.toJson());

  Position? currentPosition;
  List<Tour> onGoingTourList = [];
  List<String> locationList = ['현재 위치'.tr()];
  List<String> distanceList = [];

  // 내 주변 관광정보
  List<Tour> locationBasedList = [];
  List<TourDetail> _popularTourList = [];
  List<TourDetail> get popularTourList => _popularTourList;

  void onFetch(String lang) {
    isLoading = true;
    notifyListeners();
    fetchPopularTourList(lang: lang);
    fetchOnGoingFestival(LanguageUtil().getLanguage(lang));
    refreshPosition('1000');
    notifyListeners();
    isLoading = false;
  }

  void getProfile(User user) async {
    user = user;
    notifyListeners();
  }

  // 주소 새로고침
  void refreshPosition(String radiusData) async {
    List<String> radiusList = radiusData.split('km');
    String radius = radiusList[0];
    bool serviceEnabled;
    LocationPermission permission;

    /* 위도 경도 가져오기 시작 */
    // GPS 켜져있는지
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 권한 요청
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
    }

    final Position currentPosition = await Geolocator.getCurrentPosition();
    longitude = currentPosition.longitude;
    latitude = currentPosition.latitude;
    if (longitude != null && longitude! < 0) {
      longitude = currentPosition.longitude * -1;
    }
    /* 위도 경도 가져오기 끝 */

    // 위도,경도로 주소 가져오기
    fetchAddressData(longitude: longitude!.toString(), latitude: latitude!.toString());

    // 내 주변 관광정보 추천
    fetchLocationBasedList(longitude: longitude!.toString(), latitude: latitude!.toString(), radius: radius);
    notifyListeners();
  }

  // 위도,경도로 주소 가져오기
  void fetchAddressData({required String longitude, required String latitude}) async {
    // 주소 받아옴
    final dataList = await _getAddressInfoUseCase.execute(longitude: longitude, latitude: latitude);
    // 구/신주소 중 데이터가 있는 것을 locationList에 넣음
    if (dataList.first.roadAddress.addressName != '' && dataList.first.oldAddress.addressName != '' && !locationList.contains(dataList.first.oldAddress.addressName)) {
      locationList.insert(0, dataList.first.roadAddress.addressName);
    } else if (dataList.first.oldAddress.addressName != '' && !locationList.contains(dataList.first.oldAddress.addressName)) {
      locationList.insert(0, dataList.first.oldAddress.addressName);
    }
    // 위치 목록이 2이상 되면(주소 받아오면) 초기값 삭제
    if (locationList.contains('현재 위치'.tr())) {
      locationList.removeWhere((element) => element == '현재 위치'.tr());
      selectedLocation = locationList.first;
    }
    if (locationList.contains(locationList.first) && locationList.length > 1) {
      locationList.removeWhere((element) => element == locationList.first);
    }
    selectedLocation = locationList.first;
    // selectedLocation 변수에 새로운 주소 할당
    notifyListeners();
  }

  // 내 주변 관광정보
  void fetchLocationBasedList({
    required String latitude,
    required String longitude,
    required String radius,
  }) async {
    locationBasedList = await _getLocationBasedDataUseCase.execute(mapX: longitude, mapY: latitude, radius: radius);
    locationBasedList = locationBasedList.take(6).toList();

    // 내 주변 관광정보까지 거리 구하기
    for (int i = 0; i < locationBasedList.length; i++) {
      String result = '';
      double distance =
          getDistanceToLocation(lat1: double.parse(latitude), lon1: double.parse(longitude), lat2: double.parse(locationBasedList[i].mapy), lon2: double.parse(locationBasedList[i].mapx));

      if (distance / 10 < 1000) {
        result = '약 ${(distance * 100).toStringAsFixed(0)}m';
      } else {
        result = '약 ${(distance).toStringAsFixed(0)}Km';
      }
      distanceList.add(result);
    }

    notifyListeners();
  }

  // 스크린에 영향없음 -> private으로 선언
  // 내 위치부터 관광지까지 거리 구하기

  double getDistanceToLocation({required double lat1, required double lon1, required double lat2, required double lon2}) {
    // 지구 반지름 (km 단위)
    const double earthRadius = 6371.0;
    // 두 지점의 위도와 경도 차이를 라디안으로 변환
    double deltaLat = _toRadians(lat2 - lat1);
    double deltaLon = _toRadians(lon2 - lon1);
    // Haversine 공식
    double squareRoot = sin(deltaLat / 2) * sin(deltaLat / 2) + cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * sin(deltaLon / 2) * sin(deltaLon / 2);
    double distance = 2 * atan2(sqrt(squareRoot), sqrt(1 - squareRoot));
    // 최종 거리 계산
    double result = earthRadius * distance;
    return result;
  }

// 각도를 라디안으로 변환하는 도우미 함수
  double _toRadians(double degree) {
    return degree * (pi / 180.0);
  }

  // 진행중인 축제 모음
  void fetchOnGoingFestival(String lang) async {
    _festivalLoading = true;
    final today = DateTime.now();
    notifyListeners();
    onGoingTourList = await _getSearchFestivalUseCase.execute(eventStartDate: '20240101', eventEndDate: DateFormat('yyyyMMdd').format(today), lang: lang);
    _festivalLoading = false;
    notifyListeners();
  }

  void fetchPopularTourList({required String lang}) async {
    _popularLoading = true;
    notifyListeners();
    _popularTourList = await _getTopTenPopularTourListUseCase.execute(lang: lang);
    _popularLoading = false;
    notifyListeners();
  }
}
