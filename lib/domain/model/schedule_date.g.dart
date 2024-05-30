// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDateImpl _$$ScheduleDateImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDateImpl(
      scheduleList: (json['scheduleList'] as List<dynamic>)
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleDateImplToJson(_$ScheduleDateImpl instance) =>
    <String, dynamic>{
      'scheduleList': instance.scheduleList,
    };
