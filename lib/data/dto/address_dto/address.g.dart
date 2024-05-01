// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressName: json['address_name'] as String?,
      region1depthName: json['region_1depth_name'] as String?,
      region2depthName: json['region_2depth_name'] as String?,
      region3depthName: json['region_3depth_name'] as String?,
      mountainYn: json['mountain_yn'] as String?,
      mainAddressNo: json['main_address_no'] as String?,
      subAddressNo: json['sub_address_no'] as String?,
      zipCode: json['zip_code'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_name': instance.addressName,
      'region_1depth_name': instance.region1depthName,
      'region_2depth_name': instance.region2depthName,
      'region_3depth_name': instance.region3depthName,
      'mountain_yn': instance.mountainYn,
      'main_address_no': instance.mainAddressNo,
      'sub_address_no': instance.subAddressNo,
      'zip_code': instance.zipCode,
    };
