import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'unified_detail.freezed.dart';
part 'unified_detail.g.dart';

@freezed
class UnifiedDetail with _$UnifiedDetail {
  const factory UnifiedDetail({
    required int contentId,
    required ContentType contentType,
    required String infoCenter,
    required String openTime,
    required String useFee,
    required String useTime,
    required String restDay,
    required String parking,
    required String firstMenu,
    required String treatMenu,
    required String spendTime,
    required String playTime,
    required String petAllowed,
    required String startDate,
    required String endDate,
    required String sponsor,
    required String sponsorTel,
    required String homePage,
    required String ageLimit,
    required String placeInfo,
    required String reservationUrl,
    required String roomCount,
    required String pickup,
    required String park,
    required String subFacility,
    required String foodPlace,
    required String takeTime,
    required String saleItem,
    required String saleItemCost,
    required String scale,
    required String creditCard,
    required String distance,
    required String expGuide,
    required bool isGoodStay,
    required bool isBenikia,
    required bool isHanok,
    required bool hasSeminar,
    required bool hasSports,
    required bool hasSauna,
    required bool hasBeauty,
    required bool hasBeverage,
    required bool hasKaraoke,
    required bool hasBarbecue,
    required bool hasCampfire,
    required bool hasBicycle,
    required bool hasFitness,
    required bool hasPublicPc,
    required bool hasPublicBath,
  }) = _UnifiedDetail;

  factory UnifiedDetail.fromJson(Map<String, Object?> json) =>
      _$UnifiedDetailFromJson(json);
}
