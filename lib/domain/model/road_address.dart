import 'package:freezed_annotation/freezed_annotation.dart';

part 'road_address.freezed.dart';
part 'road_address.g.dart';

@freezed
class RoadAddress with _$RoadAddress {
  const factory RoadAddress({
    required String addressName,
    required String region1depthName,
    required String region2depthName,
    required String region3depthName,
    required String roadName,
  }) = _RoadAddress;

  factory RoadAddress.fromJson(Map<String, dynamic> json) => _$RoadAddressFromJson(json);
}
