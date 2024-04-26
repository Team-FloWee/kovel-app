// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_spot_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TouristSpotDetailImpl _$$TouristSpotDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TouristSpotDetailImpl(
      tourDetail:
          TourDetail.fromJson(json['tourDetail'] as Map<String, dynamic>),
      expGuide: json['expGuide'] as String,
      parking: json['parking'] as String,
      restDay: json['restDay'] as String,
      useTime: json['useTime'] as String,
      touristSpotDetailInfoList: (json['touristSpotDetailInfoList']
              as List<dynamic>)
          .map((e) => TouristSpotDetailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TouristSpotDetailImplToJson(
        _$TouristSpotDetailImpl instance) =>
    <String, dynamic>{
      'tourDetail': instance.tourDetail,
      'expGuide': instance.expGuide,
      'parking': instance.parking,
      'restDay': instance.restDay,
      'useTime': instance.useTime,
      'touristSpotDetailInfoList': instance.touristSpotDetailInfoList,
    };
