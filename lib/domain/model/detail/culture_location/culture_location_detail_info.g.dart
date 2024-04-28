// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_location_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CultureLocationDetailInfoImpl _$$CultureLocationDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CultureLocationDetailInfoImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      infoName: json['infoName'] as String,
      infoText: json['infoText'] as String,
    );

Map<String, dynamic> _$$CultureLocationDetailInfoImplToJson(
        _$CultureLocationDetailInfoImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'infoName': instance.infoName,
      'infoText': instance.infoText,
    };
