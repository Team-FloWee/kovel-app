// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_spot_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TouristSpotDetailInfoImpl _$$TouristSpotDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$TouristSpotDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$TouristSpotDetailInfoImplToJson(
        _$TouristSpotDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };

const _$ContentTypeEnumMap = {
  ContentType.error: 'error',
  ContentType.touristSpot: 'touristSpot',
  ContentType.cultureLocation: 'cultureLocation',
  ContentType.festival: 'festival',
  ContentType.course: 'course',
  ContentType.leports: 'leports',
  ContentType.lodgment: 'lodgment',
  ContentType.shopping: 'shopping',
  ContentType.restaurant: 'restaurant',
};
