// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      roadAddress:
          RoadAddress.fromJson(json['roadAddress'] as Map<String, dynamic>),
      oldAddress:
          OldAddress.fromJson(json['oldAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'roadAddress': instance.roadAddress,
      'oldAddress': instance.oldAddress,
    };
