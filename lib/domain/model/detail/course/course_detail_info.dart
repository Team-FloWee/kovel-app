import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'course_detail_info.freezed.dart';
part 'course_detail_info.g.dart';

@freezed
class CourseDetailInfo with _$CourseDetailInfo {
  const factory CourseDetailInfo({
    required int contentId,
    required ContentType contentType,
    required int subContentId,
    required String name,
    required String overview,
    required String imagePath,
  }) = _CourseDetailInfo;

  factory CourseDetailInfo.fromJson(Map<String, Object?> json) =>
      _$CourseDetailInfoFromJson(json);
}
