import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_search_keyword_usecase.dart';

class HomeSearchViewModel with ChangeNotifier {
  final GetSearchKeywordUseCase _getSearchKeywordUseCase;

  HomeSearchViewModel(GetSearchKeywordUseCase getSearchKeywordUseCase) : _getSearchKeywordUseCase = getSearchKeywordUseCase;

  bool isLoading = false;
  List<Tour> searchDataList = [];
  List<String> searchKeywordList = [];

  onSearch(String query) async {
    isLoading = true;
    notifyListeners();

    searchDataList = await _getSearchKeywordUseCase.execute(query: query);
    isLoading = false;
    notifyListeners();
  }

  onRefresh() {
    searchDataList = [];

    notifyListeners();
  }
}
