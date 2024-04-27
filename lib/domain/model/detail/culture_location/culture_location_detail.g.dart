// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_location_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CultureLocationDetailImpl _$$CultureLocationDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$CultureLocationDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      useFee: json['useFee'] as String,
      useTime: json['useTime'] as String,
      restDay: json['restDay'] as String,
      parking: json['parking'] as String,
      spendTime: json['spendTime'] as String,
      petAllowed: json['petAllowed'] as String,
    );

Map<String, dynamic> _$$CultureLocationDetailImplToJson(
        _$CultureLocationDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'useFee': instance.useFee,
      'useTime': instance.useTime,
      'restDay': instance.restDay,
      'parking': instance.parking,
      'spendTime': instance.spendTime,
      'petAllowed': instance.petAllowed,
    };
