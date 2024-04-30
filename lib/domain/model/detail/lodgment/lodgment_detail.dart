import 'package:freezed_annotation/freezed_annotation.dart';

part 'lodgment_detail.freezed.dart';
part 'lodgment_detail.g.dart';

@freezed
class LodgmentDetail with _$LodgmentDetail {
  const factory LodgmentDetail(
      {required int contentId,
      required int contentTypeId,
      required String infoCenter,
      required String reservationUrl,
      required String roomCount,
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
      required String pickup,
      required String park,
      required String subFacility,
      required String foodPlace}) = _LodgmentDetail;

  factory LodgmentDetail.fromJson(Map<String, Object?> json) =>
      _$LodgmentDetailFromJson(json);
}
