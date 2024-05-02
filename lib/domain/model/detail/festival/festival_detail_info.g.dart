// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalDetailInfoImpl _$$FestivalDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$FestivalDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$FestivalDetailInfoImplToJson(
        _$FestivalDetailInfoImpl instance) =>
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
