// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanDateImpl _$$PlanDateImplFromJson(Map<String, dynamic> json) =>
    _$PlanDateImpl(
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      dateList: (json['dateList'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : ScheduleDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlanDateImplToJson(_$PlanDateImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'dateList': instance.dateList,
    };
