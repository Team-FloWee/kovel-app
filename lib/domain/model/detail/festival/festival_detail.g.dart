// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalDetailImpl _$$FestivalDetailImplFromJson(Map<String, dynamic> json) =>
    _$FestivalDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      infoCenter: json['infoCenter'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      playTime: json['playTime'] as String,
      sponsor: json['sponsor'] as String,
      sponsorTel: json['sponsorTel'] as String,
      homePage: json['homePage'] as String,
      ageLimit: json['ageLimit'] as String,
      placeInfo: json['placeInfo'] as String,
      useFee: json['useFee'] as String,
    );

Map<String, dynamic> _$$FestivalDetailImplToJson(
        _$FestivalDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'infoCenter': instance.infoCenter,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'playTime': instance.playTime,
      'sponsor': instance.sponsor,
      'sponsorTel': instance.sponsorTel,
      'homePage': instance.homePage,
      'ageLimit': instance.ageLimit,
      'placeInfo': instance.placeInfo,
      'useFee': instance.useFee,
    };
