import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'unified_info.freezed.dart';
part 'unified_info.g.dart';

@freezed
class UnifiedInfo with _$UnifiedInfo {
  const factory UnifiedInfo({
    required int contentId,
    required ContentType contentType,
    required int subContentId,
    required String name,
    required String overview,
    required String imagePath,
    required String infoName,
    required String infoText,
  }) = _UnifiedInfo;

  factory UnifiedInfo.fromJson(Map<String, Object?> json) =>
      _$UnifiedInfoFromJson(json);
}
