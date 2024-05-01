import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  double? _longitude;
  double? _latitude;
  Position? currentPosition;

  void determinePosition(String radiusData) async {
    List<String> radiusList = radiusData.split('km');
    String radius = radiusList[0];
    print('radius: $radius');
    bool serviceEnabled;
    LocationPermission permission;

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
    // print('_longitude: $_longitude');
    // print('_latitude: $_latitude');
    //List tourData = await _tourInfoRepository.getLocationBasedList(mapX: _longitude.toString(), mapY: _latitude.toString(), radius: radius);
    // List tourData = await _tourInfoRepository.getLocationBasedList(mapX: '127.1216721795'.toString(), mapY: '36.4529297875'.toString(), radius: radius);
    //print(tourData[0]);
    //tourData.map((e) => e.address1).toList().forEach(print);

    //fetchAddressData('127.1216721795'.toString(), '36.4529297875'.toString()); // 안나옴
    fetchAddressData(lon: '127.423084873712'.toString(), lat: '37.0789561558879'.toString()); // 나옴
    // if (_longitude != null && _latitude != null) {
    //   // fetchAddressData(_longitude!.toStringAsFixed(12), _latitude!.toStringAsFixed(12));
    //   fetchAddressData(lon: _longitude!.toString(), lat: _latitude!.toString());
    // }
  }

  void fetchAddressData({required String lon, required String lat}) async {
    print('lat: $lat');
    print('lon: $lon');
    // 잘 나오는지 확인!
    final dataList = await AddressInfoRepositoryImpl(addressInfoDataSource: AddressInfoDataSourceImpl()).getAddress(lon, lat);
    print('addressName : ${dataList.first.roadAddress.addressName}${dataList.first.oldAddress.addressName}');
  }

  void fetchOnGoingFestival() async {
    final List<Tour> tourList = await TourInfoRepositoryImpl(tourInfoDataSource: TourInfoDataSourceImpl(dio: Dio())).getSearchFestival(eventStartDate: '20240101', eventEndDate: '20240502');
  }
}
