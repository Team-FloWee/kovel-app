import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

part 'festival_detail.freezed.dart';
part 'festival_detail.g.dart';

@freezed
class FestivalDetail with _$FestivalDetail {
  const factory FestivalDetail({
    required String startDate,
    required String endDate,
    required String playTime,
    required String sponsor,
    required String sponsorTel,
    required String homePage,
    required String ageLimit,
    required String placeInfo,
    required String useFee,
  }) = _FestivalDetail;

  factory FestivalDetail.fromJson(Map<String, Object?> json) =>
      _$FestivalDetailFromJson(json);
}
