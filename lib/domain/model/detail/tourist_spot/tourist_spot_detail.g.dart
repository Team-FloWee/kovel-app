// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_spot_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TouristSpotDetailImpl _$$TouristSpotDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TouristSpotDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
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
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'infoCenter': instance.infoCenter,
      'expGuide': instance.expGuide,
      'parking': instance.parking,
      'restDay': instance.restDay,
      'useTime': instance.useTime,
    };

const _$ContentTypeEnumMap = {
  ContentType.all: 'all',
  ContentType.touristSpot: 'touristSpot',
  ContentType.cultureLocation: 'cultureLocation',
  ContentType.festival: 'festival',
  ContentType.course: 'course',
  ContentType.leports: 'leports',
  ContentType.lodgment: 'lodgment',
  ContentType.shopping: 'shopping',
  ContentType.restaurant: 'restaurant',
};
