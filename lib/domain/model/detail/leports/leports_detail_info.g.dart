// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leports_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeportsDetailInfoImpl _$$LeportsDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$LeportsDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$LeportsDetailInfoImplToJson(
        _$LeportsDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
