import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enums/content_type.dart';

part 'course_detail.freezed.dart';
part 'course_detail.g.dart';

@freezed
class CourseDetail with _$CourseDetail {
  const factory CourseDetail({
    required int contentId,
    required ContentType contentType,
    required String takeTime,
    required String distance,
  }) = _CourseDetail;

  factory CourseDetail.fromJson(Map<String, Object?> json) =>
      _$CourseDetailFromJson(json);
}
