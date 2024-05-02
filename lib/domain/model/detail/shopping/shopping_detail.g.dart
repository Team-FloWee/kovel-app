// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingDetailImpl _$$ShoppingDetailImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      infoCenter: json['infoCenter'] as String,
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
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'infoCenter': instance.infoCenter,
      'saleItem': instance.saleItem,
      'saleItemCost': instance.saleItemCost,
      'restDay': instance.restDay,
      'scale': instance.scale,
      'creditCard': instance.creditCard,
      'openTime': instance.openTime,
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
