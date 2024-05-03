// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leports_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeportsDetailImpl _$$LeportsDetailImplFromJson(Map<String, dynamic> json) =>
    _$LeportsDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      infoCenter: json['infoCenter'] as String,
      restDay: json['restDay'] as String,
      useTime: json['useTime'] as String,
      ageLimit: json['ageLimit'] as String,
      parking: json['parking'] as String,
    );

Map<String, dynamic> _$$LeportsDetailImplToJson(_$LeportsDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'infoCenter': instance.infoCenter,
      'restDay': instance.restDay,
      'useTime': instance.useTime,
      'ageLimit': instance.ageLimit,
      'parking': instance.parking,
    };
