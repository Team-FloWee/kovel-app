// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      roadAddress: json['road_address'] == null
          ? null
          : RoadAddressDto.fromJson(
              json['road_address'] as Map<String, dynamic>),
      oldAddress: json['oldAddress'] == null
          ? null
          : OldAddressDto.fromJson(json['oldAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'road_address': instance.roadAddress,
      'oldAddress': instance.oldAddress,
    };
