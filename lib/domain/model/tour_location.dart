import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_location.freezed.dart';

part 'tour_location.g.dart';

@freezed
class TourLocation with _$TourLocation {
  const factory TourLocation({
    required int id,
    required String title,
    required String address1,
    required String address2,
    required String zipCode,
    required String areaCode,
    required String category1,
    required String category2,
    required String category3,
    required String contentTypeId,
    required String createdTime,
    required String mapx,
    required String mapy,
    required String imagePath,

  }) = _TourLocation;

  factory TourLocation.fromJson(Map<String, Object?> json) => _$TourLocationFromJson(json);
}