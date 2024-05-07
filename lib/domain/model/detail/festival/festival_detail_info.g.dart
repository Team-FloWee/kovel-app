// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalDetailInfoImpl _$$FestivalDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$FestivalDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$FestivalDetailInfoImplToJson(
        _$FestivalDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
