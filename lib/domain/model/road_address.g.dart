// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoadAddressImpl _$$RoadAddressImplFromJson(Map<String, dynamic> json) =>
    _$RoadAddressImpl(
      addressName: json['addressName'] as String,
      region1depthName: json['region1depthName'] as String,
      region2depthName: json['region2depthName'] as String,
      region3depthName: json['region3depthName'] as String,
      roadName: json['roadName'] as String,
    );

Map<String, dynamic> _$$RoadAddressImplToJson(_$RoadAddressImpl instance) =>
    <String, dynamic>{
      'addressName': instance.addressName,
      'region1depthName': instance.region1depthName,
      'region2depthName': instance.region2depthName,
      'region3depthName': instance.region3depthName,
      'roadName': instance.roadName,
    };
