// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      dateList: (json['dateList'] as List<dynamic>)
          .map((e) => ScheduleDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlanImplToJson(_$PlanImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'dateList': instance.dateList.map((e) => e.toJson()).toList(),
    };
