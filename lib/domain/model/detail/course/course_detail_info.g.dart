// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailInfoImpl _$$CourseDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      subContentId: (json['subContentId'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$CourseDetailInfoImplToJson(
        _$CourseDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'subContentId': instance.subContentId,
      'name': instance.name,
      'overview': instance.overview,
      'imagePath': instance.imagePath,
    };

const _$ContentTypeEnumMap = {
  ContentType.error: 'error',
  ContentType.touristSpot: 'touristSpot',
  ContentType.cultureLocation: 'cultureLocation',
  ContentType.festival: 'festival',
  ContentType.course: 'course',
  ContentType.leports: 'leports',
  ContentType.lodgment: 'lodgment',
  ContentType.shopping: 'shopping',
  ContentType.restaurant: 'restaurant',
};
