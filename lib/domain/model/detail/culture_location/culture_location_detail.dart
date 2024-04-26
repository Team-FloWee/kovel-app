import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

part 'culture_location_detail.freezed.dart';

part 'culture_location_detail.g.dart';

@freezed
class CultureLocationDetail with _$CultureLocationDetail {
  const factory CultureLocationDetail({
    required TourDetail tourDetail,
    required String useFee,
    required String useTime,
    required String restDay,
    required String parking,
    required String spendTime,
    required String petAllowed,

    required List<CultureLocationDetail> cultureLocationDetailList
  }) = _CultureLocationDetail;

  factory CultureLocationDetail.fromJson(Map<String, Object?> json) => _$CultureLocationDetailFromJson(json);
}