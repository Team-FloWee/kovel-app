// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leports_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeportsDetailInfoImpl _$$LeportsDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$LeportsDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$LeportsDetailInfoImplToJson(
        _$LeportsDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
