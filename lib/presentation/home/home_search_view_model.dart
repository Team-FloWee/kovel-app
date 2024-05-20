import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/use_case/get_search_keyword_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSearchViewModel with ChangeNotifier {
  final GetSearchKeywordUseCase _getSearchKeywordUseCase;

  HomeSearchViewModel({required GetSearchKeywordUseCase getSearchKeywordUseCase}) : _getSearchKeywordUseCase = getSearchKeywordUseCase;

  int _searchPageNo = 1;
  bool isLoading = false;
  bool isMoreDataLoading = false;
  bool isSearchDataLoading = false;
  String queryMore = '';
  List<Tour> _searchDataList = [];
  List<Tour> get searchDataList => _searchDataList;
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
    // searchMore에 쓸 검색어 저장
    queryMore = query;
    _searchDataList = await _getSearchKeywordUseCase.execute(query: query);
    final prefs = await SharedPreferences.getInstance();
    notifyListeners();
    if (prefs.getStringList('search_history') != null) {
      if (!prefs.getStringList('search_history')!.contains(query)) {
        searchHistoryList.insert(0, query);
        await prefs.setStringList('search_history', searchHistoryList);
      } else {
        searchHistoryList = prefs.getStringList('search_history') ?? [];
        searchHistoryList.remove(query);
        searchHistoryList.insert(0, query);
        await prefs.remove('search_history');
        await prefs.setStringList('search_history', searchHistoryList);
      }
    }

    isLoading = false;
    notifyListeners();
  }

  void onRemoveSearchHistory(int index) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('search_history') != null) {
      searchHistoryList = prefs.getStringList('search_history')!;
    }
    searchHistoryList.removeAt(index);
    await prefs.setStringList('search_history', searchHistoryList);
    notifyListeners();
  }

  void onSearchMoreData() async {
    isMoreDataLoading = true;
    print(queryMore);
    searchHistoryList.add(queryMore);
    notifyListeners();
    _searchDataList.addAll(await _getSearchKeywordUseCase.execute(
      query: queryMore,
      pageNo: ++_searchPageNo,
    ));

    final prefs = await SharedPreferences.getInstance();
    notifyListeners();

    isMoreDataLoading = false;
    notifyListeners();
  }
}
