// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lodgment_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LodgmentDetailImpl _$$LodgmentDetailImplFromJson(Map<String, dynamic> json) =>
    _$LodgmentDetailImpl(
      contentId: (json['contentId'] as num).toInt(),
      contentTypeId: (json['contentTypeId'] as num).toInt(),
      reservationUrl: json['reservationUrl'] as String,
      roomCount: json['roomCount'] as String,
      isGoodStay: json['isGoodStay'] as bool,
      isBenikia: json['isBenikia'] as bool,
      isHanok: json['isHanok'] as bool,
      hasSeminar: json['hasSeminar'] as bool,
      hasSports: json['hasSports'] as bool,
      hasSauna: json['hasSauna'] as bool,
      hasBeauty: json['hasBeauty'] as bool,
      hasBeverage: json['hasBeverage'] as bool,
      hasKaraoke: json['hasKaraoke'] as bool,
      hasBarbecue: json['hasBarbecue'] as bool,
      hasCampfire: json['hasCampfire'] as bool,
      hasBicycle: json['hasBicycle'] as bool,
      hasFitness: json['hasFitness'] as bool,
      hasPublicPc: json['hasPublicPc'] as bool,
      hasPublicBath: json['hasPublicBath'] as bool,
      pickup: json['pickup'] as String,
      park: json['park'] as String,
      subFacility: json['subFacility'] as String,
      foodPlace: json['foodPlace'] as String,
    );

Map<String, dynamic> _$$LodgmentDetailImplToJson(
        _$LodgmentDetailImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'reservationUrl': instance.reservationUrl,
      'roomCount': instance.roomCount,
      'isGoodStay': instance.isGoodStay,
      'isBenikia': instance.isBenikia,
      'isHanok': instance.isHanok,
      'hasSeminar': instance.hasSeminar,
      'hasSports': instance.hasSports,
      'hasSauna': instance.hasSauna,
      'hasBeauty': instance.hasBeauty,
      'hasBeverage': instance.hasBeverage,
      'hasKaraoke': instance.hasKaraoke,
      'hasBarbecue': instance.hasBarbecue,
      'hasCampfire': instance.hasCampfire,
      'hasBicycle': instance.hasBicycle,
      'hasFitness': instance.hasFitness,
      'hasPublicPc': instance.hasPublicPc,
      'hasPublicBath': instance.hasPublicBath,
      'pickup': instance.pickup,
      'park': instance.park,
      'subFacility': instance.subFacility,
      'foodPlace': instance.foodPlace,
    };
