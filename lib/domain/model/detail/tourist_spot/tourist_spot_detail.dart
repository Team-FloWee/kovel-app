import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail_info.dart';

part 'tourist_spot_detail.freezed.dart';

part 'tourist_spot_detail.g.dart';

@freezed
class TouristSpotDetail with _$TouristSpotDetail {
  const factory TouristSpotDetail({
    required String expGuide,
    required String parking,
    required String restDay,
    required String useTime,
  }) = _TouristSpotDetail;

  factory TouristSpotDetail.fromJson(Map<String, Object?> json) => _$TouristSpotDetailFromJson(json);
}