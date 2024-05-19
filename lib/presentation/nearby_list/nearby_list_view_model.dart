import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_location_based_data_use_case.dart';

class NearbyListViewModel with ChangeNotifier {
  final GetLocationBasedDataUseCase _getLocationBasedDataUseCase;

  NearbyListViewModel({required GetLocationBasedDataUseCase getLocationBasedDataUseCase}) : _getLocationBasedDataUseCase = getLocationBasedDataUseCase;

  List<Tour> locationBasedList = [];
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
    // locationBasedList = [];
    locationBasedList.addAll((await _getLocationBasedDataUseCase.execute(
      mapX: longitude,
      mapY: latitude,
      radius: radiusStr,
      pageNo: ++_commonPageNo,
    )));
    _isNearbyDataLoading = false;
    notifyListeners();
  }
}
