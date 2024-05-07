// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantDetailImpl _$$RestaurantDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType:
          ContentType.fromJson(json['contentType'] as Map<String, dynamic>),
      infoCenter: json['infoCenter'] as String,
      firstMenu: json['firstMenu'] as String,
      treatMenu: json['treatMenu'] as String,
      parking: json['parking'] as String,
      openTime: json['openTime'] as String,
      restDay: json['restDay'] as String,
    );

Map<String, dynamic> _$$RestaurantDetailImplToJson(
        _$RestaurantDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentType': instance.contentType,
      'infoCenter': instance.infoCenter,
      'firstMenu': instance.firstMenu,
      'treatMenu': instance.treatMenu,
      'parking': instance.parking,
      'openTime': instance.openTime,
      'restDay': instance.restDay,
    };
