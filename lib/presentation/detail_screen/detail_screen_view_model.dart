import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_detail.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';
import 'package:kovel_app/domain/repository/unified_detail_repository.dart';
import 'package:kovel_app/presentation/components/icon_text_row.dart';

class DetailScreenViewModel with ChangeNotifier {
  final UnifiedDetailRepository _unifiedDetailRepository;

  DetailScreenViewModel({
    required UnifiedDetailRepository unifiedDetailRepository,
  }) : _unifiedDetailRepository = unifiedDetailRepository;

  bool _isLoading = true;
  List<Widget> _widgets = [];
  List<TourDetail> _tourDetailData = [];
  List<UnifiedDetail> _detailData = [];
  List<UnifiedInfo> _infoData = [];

  bool get isLoading => _isLoading;
  List<Widget> get widgets => _widgets;
  List<TourDetail> get tourDetailData => _tourDetailData;
  List<UnifiedDetail> get detailData => _detailData;
  List<UnifiedInfo> get infoData => _infoData;

  void getDetailData(int id, int contentTypeId) async {
    _isLoading = true;
    notifyListeners();

    _tourDetailData = await _unifiedDetailRepository.getDetailCommon(id: id);
    print(_tourDetailData);
    _detailData = await _unifiedDetailRepository.getUnifiedDetail(
        id: id, contentTypeId: contentTypeId);
    print(_detailData);

    _isLoading = false;
    showDetailData();
    notifyListeners();
  }

  void getInfoData(int id, int contentTypeId) async {
    _infoData = await _unifiedDetailRepository.getUnifiedInfo(
        id: id, contentTypeId: contentTypeId);
    print(_infoData);

    notifyListeners();
  }

  void showDetailData() async {
    _detailData.first.toJson().forEach((key, value) {
      if (value != null &&
          value != '' &&
          value != true &&
          value != false &&
          key != 'contentId' &&
          key != 'contentType') {
        _widgets.add(
          IconTextRow(
            icon: Icons.phone,
            text: value.toString(),
          ),
        );
      }
    });
  }
}
