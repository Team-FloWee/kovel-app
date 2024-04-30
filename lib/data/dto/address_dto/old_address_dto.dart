import 'package:json_annotation/json_annotation.dart';

part 'old_address_dto.g.dart';

@JsonSerializable()
class OldAddressDto {
  @JsonKey(name: 'address_name')
  String? addressName;
  @JsonKey(name: 'region_1depth_name')
  String? region1depthName;
  @JsonKey(name: 'region_2depth_name')
  String? region2depthName;
  @JsonKey(name: 'region_3depth_name')
  String? region3depthName;
  @JsonKey(name: 'mountain_yn')
  String? mountainYn;
  @JsonKey(name: 'main_address_no')
  String? mainAddressNo;
  @JsonKey(name: 'sub_address_no')
  String? subAddressNo;
  @JsonKey(name: 'zip_code')
  String? zipCode;

  OldAddressDto({
    this.addressName,
    this.region1depthName,
    this.region2depthName,
    this.region3depthName,
    this.mountainYn,
    this.mainAddressNo,
    this.subAddressNo,
    this.zipCode,
  });

  factory OldAddressDto.fromJson(Map<String, dynamic> json) {
    return _$OldAddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OldAddressDtoToJson(this);
}
