// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_spot_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TouristSpotDetailInfoImpl _$$TouristSpotDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$TouristSpotDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$TouristSpotDetailInfoImplToJson(
        _$TouristSpotDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
