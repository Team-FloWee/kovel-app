// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unified_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnifiedInfoImpl _$$UnifiedInfoImplFromJson(Map<String, dynamic> json) =>
    _$UnifiedInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      name: json['name'] as String,
      overview: json['overview'] as String,
      subContentId: (json['subContentId'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$UnifiedInfoImplToJson(_$UnifiedInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'name': instance.name,
      'overview': instance.overview,
      'subContentId': instance.subContentId,
      'imagePath': instance.imagePath,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
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
