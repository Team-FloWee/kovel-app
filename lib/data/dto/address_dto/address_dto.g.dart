// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      roadAddress: json['road_address'] == null
          ? null
          : RoadAddress.fromJson(json['road_address'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'road_address': instance.roadAddress,
      'address': instance.address,
    };
