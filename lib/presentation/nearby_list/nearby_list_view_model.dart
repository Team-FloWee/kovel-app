import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_location_based_data_use_case.dart';

class NearbyListViewModel with ChangeNotifier {
  final GetLocationBasedDataUseCase _getLocationBasedDataUseCase;

  NearbyListViewModel({required GetLocationBasedDataUseCase getLocationBasedDataUseCase}) : _getLocationBasedDataUseCase = getLocationBasedDataUseCase;

  List<Tour> locationBasedList = [];
  bool isLoading = false;
  void onFetch(id, String language) async {
    // locationBasedList = await _getLocationBasedDataUseCase.execute(mapX: longitude, mapY: latitude, radius: radius);
  }
}
