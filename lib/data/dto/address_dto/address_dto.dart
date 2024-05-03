import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'road_address.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  @JsonKey(name: 'road_address')
  RoadAddress? roadAddress;
  Address? address;

  AddressDto({this.roadAddress, this.address});

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);
}
