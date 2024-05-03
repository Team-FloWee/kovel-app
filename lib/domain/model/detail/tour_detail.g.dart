// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourDetailImpl _$$TourDetailImplFromJson(Map<String, dynamic> json) =>
    _$TourDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
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
      createdTime: json['createdTime'] as String,
      mapx: json['mapx'] as String,
      mapy: json['mapy'] as String,
      imagePath: json['imagePath'] as String,
      tel: json['tel'] as String,
      telName: json['telName'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$$TourDetailImplToJson(_$TourDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'title': instance.title,
      'address1': instance.address1,
      'address2': instance.address2,
      'zipCode': instance.zipCode,
      'areaCode': instance.areaCode,
      'category1': instance.category1,
      'category2': instance.category2,
      'category3': instance.category3,
      'createdTime': instance.createdTime,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
      'imagePath': instance.imagePath,
      'tel': instance.tel,
      'telName': instance.telName,
      'overview': instance.overview,
    };
