// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArchivedImpl _$$ArchivedImplFromJson(Map<String, dynamic> json) =>
    _$ArchivedImpl(
      id: (json['id'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      title: json['title'] as String,
      mapx: json['mapx'] as String,
      mapy: json['mapy'] as String,
      imagePath: json['imagePath'] as String,
      tel: json['tel'] as String,
    );

Map<String, dynamic> _$$ArchivedImplToJson(_$ArchivedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contentType': instance.contentType,
      'title': instance.title,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
      'imagePath': instance.imagePath,
      'tel': instance.tel,
    };
