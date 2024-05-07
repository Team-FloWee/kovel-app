// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_spot_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TouristSpotDetailImpl _$$TouristSpotDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TouristSpotDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      infoCenter: json['infoCenter'] as String,
      expGuide: json['expGuide'] as String,
      parking: json['parking'] as String,
      restDay: json['restDay'] as String,
      useTime: json['useTime'] as String,
    );

Map<String, dynamic> _$$TouristSpotDetailImplToJson(
        _$TouristSpotDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'infoCenter': instance.infoCenter,
      'expGuide': instance.expGuide,
      'parking': instance.parking,
      'restDay': instance.restDay,
      'useTime': instance.useTime,
    };
