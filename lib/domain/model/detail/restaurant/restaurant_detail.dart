import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_detail.freezed.dart';
part 'restaurant_detail.g.dart';

@freezed
class RestaurantDetail with _$RestaurantDetail {
  const factory RestaurantDetail(
      {required int contentId,
      required int contentTypeId,
      required String infoCenter,
      required String firstMenu,
      required String treatMenu,
      required String parking,
      required String openTime,
      required String restDay}) = _RestaurantDetail;

  factory RestaurantDetail.fromJson(Map<String, Object?> json) =>
      _$RestaurantDetailFromJson(json);
}
