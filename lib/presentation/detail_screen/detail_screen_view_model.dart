import 'package:flutter/material.dart';
import 'package:kovel_app/core/method/get_detail_icon.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_detail_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_info_data_use_case.dart';
import 'package:kovel_app/presentation/components/icon_text_row.dart';

class DetailScreenViewModel with ChangeNotifier {
  final GetCommonDataUseCase _getCommonDataUseCase;
  final GetDetailDataUseCase _getDetailDataUseCase;
  final GetInfoDataUseCase _getInfoDataUseCase;

  DetailScreenViewModel({
    required GetCommonDataUseCase getCommonDataUseCase,
    required GetDetailDataUseCase getDetailDataUseCase,
    required GetInfoDataUseCase getInfoDataUseCase,
  })  : _getCommonDataUseCase = getCommonDataUseCase,
        _getDetailDataUseCase = getDetailDataUseCase,
        _getInfoDataUseCase = getInfoDataUseCase;

  Exception? error;
  bool _isLoading = true;
  bool _isFavorite = false;
  List<Widget> _widgets = [];
  late TourDetail _tourDetailData;
  late UnifiedDetail _detailData;
  List<UnifiedInfo> _infoData = [];

  bool get isLoading => _isLoading;

  bool get isFavorite => _isFavorite;

  List<Widget> get widgets => _widgets;

  TourDetail get tourDetailData => _tourDetailData;

  UnifiedDetail get detailData => _detailData;

  List<UnifiedInfo> get infoData => _infoData;

  void onRefresh() {
    _isLoading = false;
    _widgets = [];
    _tourDetailData;
    _detailData;
    _infoData = [];
    error = null;

    notifyListeners();
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void getDetailData(int id, int contentTypeId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _tourDetailData = await _getCommonDataUseCase.execute(id: id);
      _detailData = await _getDetailDataUseCase.execute(
          id: id, contentTypeId: contentTypeId);

      showDetailData();

      _isLoading = false;
    } on Exception catch (e) {
      _isLoading = false;

      error = e;
    }

    notifyListeners();
  }

  void getInfoData(int id, int contentTypeId) async {
    _infoData =
        await _getInfoDataUseCase.execute(id: id, contentTypeId: contentTypeId);

    notifyListeners();
  }

  void showDetailData() async {
    _detailData.toJson().forEach((key, value) {
      if (value != null &&
          value != '' &&
          value != true &&
          value != false &&
          key != 'contentId' &&
          key != 'contentType' &&
          key != 'firstMenu') {
        _widgets.add(
          IconTextRow(
            icon: getDetailIcon(key.toString()),
            text: value.toString(),
          ),
        );
      }
    });
  }
}
