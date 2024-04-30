import 'package:json_annotation/json_annotation.dart';

import 'old_address_dto.dart';
import 'road_address_dto.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  @JsonKey(name: 'road_address')
  RoadAddressDto? roadAddress;
  OldAddressDto? oldAddress;

  AddressDto({this.roadAddress, this.oldAddress});

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);
}
