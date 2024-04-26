import 'package:freezed_annotation/freezed_annotation.dart';

part 'tourist_spot_detail_info.freezed.dart';

part 'tourist_spot_detail_info.g.dart';

@freezed
class TouristSpotDetailInfo with _$TouristSpotDetailInfo {
  const factory TouristSpotDetailInfo({
    required String infoName,
    required String infoText,
  }) = _TouristSpotDetailInfo;

  factory TouristSpotDetailInfo.fromJson(Map<String, Object?> json) => _$TouristSpotDetailInfoFromJson(json);
}