import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'culture_location_detail.freezed.dart';
part 'culture_location_detail.g.dart';

@freezed
class CultureLocationDetail with _$CultureLocationDetail {
  const factory CultureLocationDetail({
    required int contentId,
    required ContentType contentType,
    required String infoCenter,
    required String useFee,
    required String useTime,
    required String restDay,
    required String parking,
    required String spendTime,
    required String petAllowed,
  }) = _CultureLocationDetail;

  factory CultureLocationDetail.fromJson(Map<String, Object?> json) =>
      _$CultureLocationDetailFromJson(json);
}
