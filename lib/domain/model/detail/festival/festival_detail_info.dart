import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';

part 'festival_detail_info.freezed.dart';
part 'festival_detail_info.g.dart';

@freezed
class FestivalDetailInfo with _$FestivalDetailInfo {
  const factory FestivalDetailInfo({
    required int contentId,
    required ContentType contentType,
    required String infoName,
    required String infoText,
  }) = _FestivalDetailInfo;

  factory FestivalDetailInfo.fromJson(Map<String, Object?> json) =>
      _$FestivalDetailInfoFromJson(json);
}
