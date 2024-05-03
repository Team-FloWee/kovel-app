// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailImpl _$$CourseDetailImplFromJson(Map<String, dynamic> json) =>
    _$CourseDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      takeTime: json['takeTime'] as String,
      distance: json['distance'] as String,
    );

Map<String, dynamic> _$$CourseDetailImplToJson(_$CourseDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'takeTime': instance.takeTime,
      'distance': instance.distance,
    };

const _$ContentTypeEnumMap = {
  ContentType.all: 'all',
  ContentType.touristSpot: 'touristSpot',
  ContentType.cultureLocation: 'cultureLocation',
  ContentType.festival: 'festival',
  ContentType.course: 'course',
  ContentType.leports: 'leports',
  ContentType.lodgment: 'lodgment',
  ContentType.shopping: 'shopping',
  ContentType.restaurant: 'restaurant',
};
