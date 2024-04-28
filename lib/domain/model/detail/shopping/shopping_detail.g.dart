// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingDetailImpl _$$ShoppingDetailImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      saleItem: json['saleItem'] as String,
      saleItemCost: json['saleItemCost'] as String,
      restDay: json['restDay'] as String,
      scale: json['scale'] as String,
      creditCard: json['creditCard'] as String,
      openTime: json['openTime'] as String,
    );

Map<String, dynamic> _$$ShoppingDetailImplToJson(
        _$ShoppingDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'saleItem': instance.saleItem,
      'saleItemCost': instance.saleItemCost,
      'restDay': instance.restDay,
      'scale': instance.scale,
      'creditCard': instance.creditCard,
      'openTime': instance.openTime,
    };
