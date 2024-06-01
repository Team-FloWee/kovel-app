// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDateImpl _$$ScheduleDateImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDateImpl(
      day: (json['day'] as num).toInt(),
      scheduleList: (json['scheduleList'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleDateImplToJson(_$ScheduleDateImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'scheduleList': instance.scheduleList.map((e) => e?.toJson()).toList(),
    };
