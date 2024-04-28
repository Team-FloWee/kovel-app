// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalDetailInfoImpl _$$FestivalDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$FestivalDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$FestivalDetailInfoImplToJson(
        _$FestivalDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
