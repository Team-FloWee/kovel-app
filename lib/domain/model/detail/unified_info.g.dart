// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unified_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnifiedInfoImpl _$$UnifiedInfoImplFromJson(Map<String, dynamic> json) =>
    _$UnifiedInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      subContentId: (json['subContentId'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      imagePath: json['imagePath'] as String,
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$UnifiedInfoImplToJson(_$UnifiedInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'subContentId': instance.subContentId,
      'name': instance.name,
      'overview': instance.overview,
      'imagePath': instance.imagePath,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
