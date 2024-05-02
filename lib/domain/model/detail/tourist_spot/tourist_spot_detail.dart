import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'tourist_spot_detail.freezed.dart';
part 'tourist_spot_detail.g.dart';

@freezed
class TouristSpotDetail with _$TouristSpotDetail {
  const factory TouristSpotDetail({
    required int contentId,
    required ContentType contentType,
    required String infoCenter,
    required String expGuide,
    required String parking,
    required String restDay,
    required String useTime,
  }) = _TouristSpotDetail;

  factory TouristSpotDetail.fromJson(Map<String, Object?> json) =>
      _$TouristSpotDetailFromJson(json);
}
