// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leports_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeportsDetailImpl _$$LeportsDetailImplFromJson(Map<String, dynamic> json) =>
    _$LeportsDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      restDay: json['restDay'] as String,
      useTime: json['useTime'] as String,
      ageLimit: json['ageLimit'] as String,
      parking: json['parking'] as String,
    );

Map<String, dynamic> _$$LeportsDetailImplToJson(_$LeportsDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'restDay': instance.restDay,
      'useTime': instance.useTime,
      'ageLimit': instance.ageLimit,
      'parking': instance.parking,
    };
