import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'leports_detail.freezed.dart';
part 'leports_detail.g.dart';

@freezed
class LeportsDetail with _$LeportsDetail {
  const factory LeportsDetail({
    required int contentId,
    required ContentType contentType,
    required String infoCenter,
    required String restDay,
    required String useTime,
    required String ageLimit,
    required String parking,
  }) = _LeportsDetail;

  factory LeportsDetail.fromJson(Map<String, Object?> json) =>
      _$LeportsDetailFromJson(json);
}
