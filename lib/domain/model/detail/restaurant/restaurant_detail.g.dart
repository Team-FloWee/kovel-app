// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantDetailImpl _$$RestaurantDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
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
      'contentTypeId': instance.contentTypeId,
      'firstMenu': instance.firstMenu,
      'treatMenu': instance.treatMenu,
      'parking': instance.parking,
      'openTime': instance.openTime,
      'restDay': instance.restDay,
    };
