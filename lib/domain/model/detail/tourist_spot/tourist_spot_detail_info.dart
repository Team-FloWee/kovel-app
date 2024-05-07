import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';

part 'tourist_spot_detail_info.freezed.dart';

part 'tourist_spot_detail_info.g.dart';

@freezed
class TouristSpotDetailInfo with _$TouristSpotDetailInfo {
  const factory TouristSpotDetailInfo({
    required int contentId,
    required ContentType contentType,
    required String infoName,
    required String infoText,
  }) = _TouristSpotDetailInfo;

  factory TouristSpotDetailInfo.fromJson(Map<String, Object?> json) => _$TouristSpotDetailInfoFromJson(json);
}