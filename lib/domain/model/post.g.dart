// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postTypeId: json['postTypeId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postTypeId': instance.postTypeId,
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
