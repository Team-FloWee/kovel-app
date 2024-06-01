// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPlanImpl _$$UserPlanImplFromJson(Map<String, dynamic> json) =>
    _$UserPlanImpl(
      userId: json['userId'] as String,
      dateList: (json['dateList'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : ScheduleDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPlanImplToJson(_$UserPlanImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'dateList': instance.dateList.map((e) => e?.toJson()).toList(),
    };
