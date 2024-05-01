import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
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

  Address({
    this.addressName,
    this.region1depthName,
    this.region2depthName,
    this.region3depthName,
    this.mountainYn,
    this.mainAddressNo,
    this.subAddressNo,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
