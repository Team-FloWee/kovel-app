// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailInfoImpl _$$CourseDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      subContentId: (json['subContentId'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$CourseDetailInfoImplToJson(
        _$CourseDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'subContentId': instance.subContentId,
      'name': instance.name,
      'overview': instance.overview,
      'imagePath': instance.imagePath,
    };
