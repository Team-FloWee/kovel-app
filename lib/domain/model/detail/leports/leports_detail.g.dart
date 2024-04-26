// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leports_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeportsDetailImpl _$$LeportsDetailImplFromJson(Map<String, dynamic> json) =>
    _$LeportsDetailImpl(
      restDay: json['restDay'] as String,
      useTime: json['useTime'] as String,
      ageLimit: json['ageLimit'] as String,
      parking: json['parking'] as String,
      leportsDetailInfoList: (json['leportsDetailInfoList'] as List<dynamic>)
          .map((e) => LeportsDetailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LeportsDetailImplToJson(_$LeportsDetailImpl instance) =>
    <String, dynamic>{
      'restDay': instance.restDay,
      'useTime': instance.useTime,
      'ageLimit': instance.ageLimit,
      'parking': instance.parking,
      'leportsDetailInfoList': instance.leportsDetailInfoList,
    };
