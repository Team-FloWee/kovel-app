// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadAddressDto _$RoadAddressDtoFromJson(Map<String, dynamic> json) =>
    RoadAddressDto(
      addressName: json['address_name'] as String?,
      region1depthName: json['region_1depth_name'] as String?,
      region2depthName: json['region_2depth_name'] as String?,
      region3depthName: json['region_3depth_name'] as String?,
      roadName: json['road_name'] as String?,
      undergroundYn: json['underground_yn'] as String?,
      mainBuildingNo: json['main_building_no'] as String?,
      subBuildingNo: json['sub_building_no'] as String?,
      buildingName: json['building_name'] as String?,
      zoneNo: json['zone_no'] as String?,
    );

Map<String, dynamic> _$RoadAddressDtoToJson(RoadAddressDto instance) =>
    <String, dynamic>{
      'address_name': instance.addressName,
      'region_1depth_name': instance.region1depthName,
      'region_2depth_name': instance.region2depthName,
      'region_3depth_name': instance.region3depthName,
      'road_name': instance.roadName,
      'underground_yn': instance.undergroundYn,
      'main_building_no': instance.mainBuildingNo,
      'sub_building_no': instance.subBuildingNo,
      'building_name': instance.buildingName,
      'zone_no': instance.zoneNo,
    };
