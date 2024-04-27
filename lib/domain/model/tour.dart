import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour.freezed.dart';

part 'tour.g.dart';

@freezed
class Tour with _$Tour {
  const factory Tour({
    required int id,
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
  }) = _Tour;

  factory Tour.fromJson(Map<String, Object?> json) => _$TourFromJson(json);
}