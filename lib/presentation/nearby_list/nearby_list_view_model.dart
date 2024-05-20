import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_location_based_data_use_case.dart';

class NearbyListViewModel with ChangeNotifier {
  final GetLocationBasedDataUseCase _getLocationBasedDataUseCase;

  NearbyListViewModel({required GetLocationBasedDataUseCase getLocationBasedDataUseCase}) : _getLocationBasedDataUseCase = getLocationBasedDataUseCase;

  List<Tour> locationBasedList = [];
  List<String> distanceList = [];
  final bool _isLoading = false;
  bool _isNearbyDataLoading = false;

  bool get isLoading => _isLoading;
  bool get isNearbyDataLoading => _isNearbyDataLoading;

  int _commonPageNo = 1;

  void onFetch({
    required String longitude,
    required String latitude,
    required String radius,
  }) async {
    List<String> radiusList = radius.split('km');
    String radiusStr = radiusList[0];
    radiusStr = (double.parse(radiusStr) * 1000).toString();
    locationBasedList = await _getLocationBasedDataUseCase.execute(
      mapX: longitude,
      mapY: latitude,
      radius: radiusStr,
    );

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

  void fetchMoreNearbyData({
    required String longitude,
    required String latitude,
    required String radius,
  }) async {
    List<String> radiusList = radius.split('km');
    String radiusStr = radiusList[0];
    radiusStr = (double.parse(radiusStr) * 1000).toString();
    _isNearbyDataLoading = true;
    notifyListeners();

    locationBasedList.addAll((await _getLocationBasedDataUseCase.execute(
      mapX: longitude,
      mapY: latitude,
      radius: radiusStr,
      pageNo: ++_commonPageNo,
    )));
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
    _isNearbyDataLoading = false;
    notifyListeners();
  }

  double _toRadians(double degree) {
    return degree * (pi / 180.0);
  }

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
}
