import 'package:flutter/material.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';
import 'package:logger/logger.dart';

import '../../../domain/model/detail/lodgment/lodgment_detail.dart';
import '../../../domain/model/detail/restaurant/restaurant_detail.dart';
import '../../../domain/model/detail/shopping/shopping_detail.dart';
import '../../../domain/model/detail/tour_detail.dart';

class ContentsDetailViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool _isFavorite = false;
  final int _id;
  final TourInfoRepository _tourInfoRepository;

  ContentsDetailViewModel(
      {required int id, required TourInfoRepository tourInfoRepository})
      : _tourInfoRepository = tourInfoRepository,
        _id = id;

  // 공통 정보 목록을 저장할 변수
  TourDetail? _tourDetailData;

  TourDetail? get tourDetailData => _tourDetailData;

  // 음식점 소개 정보 목록을 저장할 변수
  RestaurantDetail? _restaurantDetailData;

  RestaurantDetail? get restaurantDetailData => _restaurantDetailData;

  // 숙박 소개 정보 목록을 저장할 변수
  LodgmentDetail? _lodgmentDetailData;

  LodgmentDetail? get lodgmentDetailData => _lodgmentDetailData;

  // 쇼핑 소개 정보 목록을 저장할 변수
  ShoppingDetail? _shoppingDetailData;

  ShoppingDetail? get shoppingDetailData => _shoppingDetailData;

  // 로딩 중일 시, 로딩 화면 노출
  bool get isLoading => _isLoading;

  // 하트 버튼 누르면 색상 변경
  bool get isFavorite => _isFavorite;

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  // html tag 제거
  String? _htmlUrlString;
  String? _htmlOverviewString;

  String? get htmlString => _htmlUrlString;

  String? get htmlOverviewString => _htmlOverviewString;

  String _removeHtmlTags(String? htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    return htmlText?.replaceAll(exp, '') ?? '';
  }

  // 공통 정보 목록을 가져 오는 메서드
  void getTourDetailData() async {
    _isLoading = true;

    notifyListeners();

    List<TourDetail> result =
        await _tourInfoRepository.getDetailCommon(id: _id);

    _tourDetailData = result.first;

    _tourDetailData!;

    getContentsDetailData();

    notifyListeners();
  }

  // contentId 값에 따라 소개 정보 목록을 가져 오는 메서드
  void getContentsDetailData() async {
    int contentId = _id;

    if (_tourDetailData != null) {
      int contentTypeId = _tourDetailData!.contentTypeId;

      switch (contentTypeId) {
        case 39:
          // 음식점 정보
          List<RestaurantDetail> result = await _tourInfoRepository
              .getRestaurantDetail(id: contentId, contentTypeId: contentTypeId);

          _restaurantDetailData = result.first;

          break;
        case 32:
          // 숙박 정보
          List<LodgmentDetail> lodgmentDetailResult = await _tourInfoRepository
              .getLodgmentDetail(id: contentId, contentTypeId: contentTypeId);

          _lodgmentDetailData = lodgmentDetailResult.first;

          // url html 제거
          _lodgmentDetailData = _lodgmentDetailData?.copyWith(
              reservationUrl:
                  _removeHtmlTags(_lodgmentDetailData?.reservationUrl));

          // overview html 제거
          _tourDetailData = _tourDetailData?.copyWith(
              overview: _removeHtmlTags(_tourDetailData?.overview));

          break;
        case 38:
          // 쇼핑 정보
          List<ShoppingDetail> shoppingDetailResult = await _tourInfoRepository
              .getShoppingDetail(id: contentId, contentTypeId: contentTypeId);

          _shoppingDetailData = shoppingDetailResult.first;

          break;
      }
    }

    _isLoading = false;

    notifyListeners();
  }
}
