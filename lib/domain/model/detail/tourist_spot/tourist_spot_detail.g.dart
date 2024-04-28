// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_spot_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TouristSpotDetailImpl _$$TouristSpotDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TouristSpotDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      expGuide: json['expGuide'] as String,
      parking: json['parking'] as String,
      restDay: json['restDay'] as String,
      useTime: json['useTime'] as String,
    );

Map<String, dynamic> _$$TouristSpotDetailImplToJson(
        _$TouristSpotDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'expGuide': instance.expGuide,
      'parking': instance.parking,
      'restDay': instance.restDay,
      'useTime': instance.useTime,
    };
