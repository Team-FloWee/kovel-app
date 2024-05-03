// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourImpl _$$TourImplFromJson(Map<String, dynamic> json) => _$TourImpl(
      id: (json['id'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      title: json['title'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      zipCode: json['zipCode'] as String,
      areaCode: json['areaCode'] as String,
      category1: json['category1'] as String,
      category2: json['category2'] as String,
      category3: json['category3'] as String,
      categoryType:
          CategoryType.fromJson(json['categoryType'] as Map<String, dynamic>),
      createdTime: json['createdTime'] as String,
      mapx: json['mapx'] as String,
      mapy: json['mapy'] as String,
      imagePath: json['imagePath'] as String,
      tel: json['tel'] as String,
    );

Map<String, dynamic> _$$TourImplToJson(_$TourImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contentType': instance.contentType,
      'title': instance.title,
      'address1': instance.address1,
      'address2': instance.address2,
      'zipCode': instance.zipCode,
      'areaCode': instance.areaCode,
      'category1': instance.category1,
      'category2': instance.category2,
      'category3': instance.category3,
      'categoryType': instance.categoryType,
      'createdTime': instance.createdTime,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
      'imagePath': instance.imagePath,
      'tel': instance.tel,
    };
