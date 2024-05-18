import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_search_keyword_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSearchViewModel with ChangeNotifier {
  final GetSearchKeywordUseCase _getSearchKeywordUseCase;

  HomeSearchViewModel(GetSearchKeywordUseCase getSearchKeywordUseCase) : _getSearchKeywordUseCase = getSearchKeywordUseCase;

  bool isLoading = false;
  List<Tour> searchDataList = [];
  List<String> searchKeywordList = [];
  List<String> searchHistoryList = [];
  void onTapSearchBar() async {
    final prefs = await SharedPreferences.getInstance();
    searchHistoryList = prefs.getStringList('search_history') ?? [];
  }

  void onLoadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    searchHistoryList = prefs.getStringList('search_history') ?? [];
    searchHistoryList = searchHistoryList.take(5).toList();
    notifyListeners();
  }

  void onSearch(String query) async {
    isLoading = true;
    searchHistoryList.add(query);
    searchDataList = await _getSearchKeywordUseCase.execute(query: query);
    final prefs = await SharedPreferences.getInstance();
    notifyListeners();

    await prefs.setStringList('search_history', searchHistoryList);
    isLoading = false;
    notifyListeners();
  }

  void onRemoveSearchHistory(int index) async {
    searchHistoryList.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', searchHistoryList);
    notifyListeners();
  }
}
