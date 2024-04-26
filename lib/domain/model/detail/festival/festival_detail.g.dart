// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalDetailImpl _$$FestivalDetailImplFromJson(Map<String, dynamic> json) =>
    _$FestivalDetailImpl(
      tourDetail:
          TourDetail.fromJson(json['tourDetail'] as Map<String, dynamic>),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      playTime: json['playTime'] as String,
      sponsor: json['sponsor'] as String,
      sponsorTel: json['sponsorTel'] as String,
      homePage: json['homePage'] as String,
      ageLimit: json['ageLimit'] as String,
      placeInfo: json['placeInfo'] as String,
      useFee: json['useFee'] as String,
      festivalDetailInfoList: (json['festivalDetailInfoList'] as List<dynamic>)
          .map((e) => FestivalDetailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FestivalDetailImplToJson(
        _$FestivalDetailImpl instance) =>
    <String, dynamic>{
      'tourDetail': instance.tourDetail,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'playTime': instance.playTime,
      'sponsor': instance.sponsor,
      'sponsorTel': instance.sponsorTel,
      'homePage': instance.homePage,
      'ageLimit': instance.ageLimit,
      'placeInfo': instance.placeInfo,
      'useFee': instance.useFee,
      'festivalDetailInfoList': instance.festivalDetailInfoList,
    };
