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
  String selectedLocation = '현재 위치';
  Position? currentPosition;
  List<String> locationList = ['현재 위치']; // TODO:초기값은 firebase연결 후에 이전 연결주소
  List<Tour> onGoingTourList = [];
  List<Tour> locationBasedList = []; // TODO: 초기값 firebase연결 후에 이전 받아온 관광정보

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
    fetchAddressData(longitude: _longitude!.toString(), latitude: _latitude!.toString());

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
    if (dataList.first.roadAddress.addressName != '' && dataList.first.oldAddress.addressName != '') {
      locationList.insert(0, dataList.first.roadAddress.addressName);
    } else if (dataList.first.oldAddress.addressName != '') {
      locationList.insert(0, dataList.first.oldAddress.addressName);
    }
    // 위치 목록이 2이상 되면(주소 받아오면) 초기값 삭제
    locationList.length > 1
        ? locationList.removeWhere((element) => element == '현재 위치')
        : !locationList.contains(selectedLocation)
            ? selectedLocation = locationList.first
            : print('같음');
    notifyListeners(); // TODO: await 때문에 notifyListeners()실행 후 주소가져옴. 해결방법은?
    print('================notifyListeners2');
  }

  // 내 주변 관광정보
  void fetchLocationBasedList(String latitude, String longitude, String radius) async {
    locationBasedList = await TourInfoRepositoryImpl(tourInfoDataSource: TourInfoDataSourceImpl(dio: Dio())).getLocationBasedList(mapX: longitude, mapY: latitude, radius: radius);
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
