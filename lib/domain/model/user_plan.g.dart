// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPlanImpl _$$UserPlanImplFromJson(Map<String, dynamic> json) =>
    _$UserPlanImpl(
      userId: json['userId'] as String,
      planList: (json['planList'] as List<dynamic>)
          .map((e) => PlanDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPlanImplToJson(_$UserPlanImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'planList': instance.planList,
    };
