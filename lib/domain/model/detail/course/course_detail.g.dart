// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailImpl _$$CourseDetailImplFromJson(Map<String, dynamic> json) =>
    _$CourseDetailImpl(
      takeTime: json['takeTime'] as String,
      distance: json['distance'] as String,
      courseDetailInfoList: (json['courseDetailInfoList'] as List<dynamic>)
          .map((e) => CourseDetailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CourseDetailImplToJson(_$CourseDetailImpl instance) =>
    <String, dynamic>{
      'takeTime': instance.takeTime,
      'distance': instance.distance,
      'courseDetailInfoList': instance.courseDetailInfoList,
    };
