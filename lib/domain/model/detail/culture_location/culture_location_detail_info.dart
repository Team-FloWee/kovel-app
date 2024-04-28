import 'package:freezed_annotation/freezed_annotation.dart';

part 'culture_location_detail_info.freezed.dart';

part 'culture_location_detail_info.g.dart';

@freezed
class CultureLocationDetailInfo with _$CultureLocationDetailInfo {
  const factory CultureLocationDetailInfo({
    required int contentId,
    required int contentTypeId,
    required String infoName,
    required String infoText,
  }) = _CultureLocationDetailInfo;

  factory CultureLocationDetailInfo.fromJson(Map<String, Object?> json) => _$CultureLocationDetailInfoFromJson(json);
}