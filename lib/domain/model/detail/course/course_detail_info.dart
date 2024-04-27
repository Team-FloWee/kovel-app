import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_detail_info.freezed.dart';
part 'course_detail_info.g.dart';

@freezed
class CourseDetailInfo with _$CourseDetailInfo {
  const factory CourseDetailInfo({
    required int contentId,
    required int contentTypeId,
    required String name,
    required String overview,
  }) = _CourseDetailInfo;

  factory CourseDetailInfo.fromJson(Map<String, Object?> json) =>
      _$CourseDetailInfoFromJson(json);
}
