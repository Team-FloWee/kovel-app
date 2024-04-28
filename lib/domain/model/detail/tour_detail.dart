import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_detail.freezed.dart';

part 'tour_detail.g.dart';

@freezed
class TourDetail with _$TourDetail {
  const factory TourDetail({
    required int contentId,
    required int contentTypeId,
    required String title,
    required String address1,
    required String address2,
    required String zipCode,
    required String areaCode,
    required String category1,
    required String category2,
    required String category3,
    required String createdTime,
    required String mapx,
    required String mapy,
    required String imagePath,
    required String tel,
    required String telName,
    required String overview,
  }) = _TourDetail;

  factory TourDetail.fromJson(Map<String, Object?> json) => _$TourDetailFromJson(json);
}