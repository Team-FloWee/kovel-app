import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:kovel_app/data/data_source/address_info_data_source_impl.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/address_info_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/tour_info_repository_impl.dart';
import 'package:kovel_app/domain/model/tour.dart';

class HomeViewModel with ChangeNotifier {
  final TourInfoRepositoryImpl _tourInfoRepository;
  HomeViewModel({
    required TourInfoRepositoryImpl tourInfoRepository,
  }) : _tourInfoRepository = tourInfoRepository;
  bool isLoading = false;
  double? _longitude;
  double? _latitude;
  double distance = 0;
  String selectedLocation = '현재 위치';
  Position? currentPosition;
  List<String> locationList = ['현재 위치']; // TODO:초기값은 firebase연결 후에 이전 연결주소
  List<Tour> onGoingTourList = [];
  // 내 주변 관광정보
  List<Tour> locationBasedList = []; // TODO: 초기값 firebase연결 후에 이전 받아온 관광정보
  List<Map<String, double>> distanceList = [];

  void onFetch() {
    isLoading = true;
    notifyListeners();
    fetchOnGoingFestival();
    print('festival 패치됨');
    notifyListeners();
    isLoading = false;
    print('==============fetch됨');
  }

  // 주소 새로고침
  void refreshPosition(String radiusData) async {
    List<String> radiusList = radiusData.split('km');
    String radius = radiusList[0];
    print('radius: $radius');
    bool serviceEnabled;
    LocationPermission permission;

    /* 위도 경도 가져오기 시작 */
    // GPS 켜져있는지
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    // 권한 요청
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    // 두번 이상 거부하면 계속 거부한 것으로 보고 에러냄
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final Position currentPosition = await Geolocator.getCurrentPosition();
    _longitude = currentPosition.longitude;
    _latitude = currentPosition.latitude;
    if (_longitude != null && _longitude! < 0) {
      _longitude = currentPosition.longitude * -1;
    }
    /* 위도 경도 가져오기 끝 */

    // 위도,경도로 주소 가져오기
    //fetchAddressData(longitude: _longitude!.toString(), latitude: _latitude!.toString());
    fetchAddressData(longitude: '127.1216721795', latitude: '36.4529297875');

    // 내 주변 관광정보 추천
    //fetchLocationBasedList(longitude: _longitude!.toString(), latitude: _latitude!.toString(), radius: radius);
    fetchLocationBasedList(longitude: '127.1216721795', latitude: '36.4529297875', radius: radius);

    print('#############distanceList: $distanceList');
    notifyListeners();
    print('================notifyListeners1');
  }

  // 위도,경도로 주소 가져오기
  void fetchAddressData({required String longitude, required String latitude}) async {
    print('===fetchAddressData시작');
    print('latitude: $latitude');
    print('longitude: $longitude');
    // 주소 받아옴
    final dataList = await AddressInfoRepositoryImpl(addressInfoDataSource: AddressInfoDataSourceImpl()).getAddress(longitude: longitude, latitude: latitude);

    // 구/신주소 중 데이터가 있는 것을 locationList에 넣음
    if (dataList.first.roadAddress.addressName != '' && dataList.first.oldAddress.addressName != '' && !locationList.contains(dataList.first.oldAddress.addressName)) {
      locationList.insert(0, dataList.first.roadAddress.addressName);
    } else if (dataList.first.oldAddress.addressName != '' && !locationList.contains(dataList.first.oldAddress.addressName)) {
      locationList.insert(0, dataList.first.oldAddress.addressName);
    }
    // 위치 목록이 2이상 되면(주소 받아오면) 초기값 삭제
    if (locationList.contains('현재 위치')) {
      locationList.removeWhere((element) => element == '현재 위치');
      selectedLocation = locationList.first;
    }

    // locationList에 첫 번째 요소로 새 주소 추가
    //locationList.insert(0, newLocation);
    // '현재 위치' 요소가 있으면 삭제

    // selectedLocation 변수에 새로운 주소 할당
    selectedLocation = locationList.first;

    notifyListeners(); // TODO: await 때문에 notifyListeners()실행 후 주소가져옴. 해결방법은?
    print('================notifyListeners2');
  }

  // 내 주변 관광정보
  void fetchLocationBasedList({required String latitude, required String longitude, required String radius}) async {
    locationBasedList = await TourInfoRepositoryImpl(tourInfoDataSource: TourInfoDataSourceImpl(dio: Dio())).getLocationBasedList(mapX: longitude, mapY: latitude, radius: radius);
    // TODO: address datasource에 null체크 추가 필요함

    print('locationBasedList.length: ${locationBasedList.length}');
    // 내 주변 관광정보까지 거리 구하기
    // TODO: 내 주변 관광정보 받아오는 게 늦어서 여기가 돌질 않음
    for (int i = 0; i < locationBasedList.length; i++) {
      distanceList.add({
        locationBasedList[i].id.toString(): getDistanceToLocation(
            lat1: double.parse('36.4529297875'), lon1: double.parse('127.1216721795'), lat2: double.parse(locationBasedList[i].mapy), lon2: double.parse(locationBasedList[i].mapx)),
      });
      print('계산된 distance$i');
      print(getDistanceToLocation(
          lat1: double.parse('36.4529297875'), lon1: double.parse('127.1216721795'), lat2: double.parse(locationBasedList[i].mapy), lon2: double.parse(locationBasedList[i].mapx)));
    }
    print('내 주변 관광정보: $locationBasedList');
    print('계산 테스트 : ');
    print(getDistanceToLocation(lat1: 36.2708, lon1: 127.3020, lat2: 36.2800, lon2: 127.2930).toString());
    notifyListeners();
  }

  // 내 위치부터 관광지까지 거리 구하기
  double getDistanceToLocation({required double lat1, required double lon1, required double lat2, required double lon2}) {
    // 지구 반지름 (km 단위)
    const double earthRadius = 6371.0;

    // 두 지점의 위도와 경도 차이를 라디안으로 변환
    double deltaLat = _toRadians(lat2 - lat1);
    double deltaLon = _toRadians(lon2 - lon1);

    // Haversine 공식
    double a = sin(deltaLat / 2) * sin(deltaLat / 2) + cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * sin(deltaLon / 2) * sin(deltaLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // 최종 거리 계산
    double distance = earthRadius * c;
    print('==============distance: $distance');
    return distance;
  }

// 각도를 라디안으로 변환하는 도우미 함수
  double _toRadians(double degree) {
    return degree * (pi / 180.0);
  }

  // 진행중인 축제 모음
  void fetchOnGoingFestival() async {
    isLoading = true;
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    print(DateFormat('yyyyMMdd').format(tomorrow));
    notifyListeners();
    onGoingTourList =
        await TourInfoRepositoryImpl(tourInfoDataSource: TourInfoDataSourceImpl(dio: Dio())).getSearchFestival(eventStartDate: '20240101', eventEndDate: DateFormat('yyyyMMdd').format(today));
    isLoading = false;
    notifyListeners();
    //print('onGoingTourList: ${onGoingTourList[0].imagePath}');
    for (var element in onGoingTourList) {
      print(element);
    }
  }
}
