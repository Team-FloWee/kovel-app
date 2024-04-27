// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailInfoImpl _$$CourseDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$$CourseDetailInfoImplToJson(
        _$CourseDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'name': instance.name,
      'overview': instance.overview,
    };
