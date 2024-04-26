import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail_info.dart';

part 'leports_detail.freezed.dart';
part 'leports_detail.g.dart';

@freezed
class LeportsDetail with _$LeportsDetail {
  const factory LeportsDetail({
    required String restDay,
    required String useTime,
    required String ageLimit,
    required String parking,
    required List<LeportsDetailInfo> leportsDetailInfoList,
  }) = _LeportsDetail;

  factory LeportsDetail.fromJson(Map<String, Object?> json) =>
      _$LeportsDetailFromJson(json);
}
