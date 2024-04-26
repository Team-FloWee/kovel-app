import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';

part 'course_detail.freezed.dart';
part 'course_detail.g.dart';

@freezed
class CourseDetail with _$CourseDetail {
  const factory CourseDetail({
    required String takeTime,
    required String distance,
    required List<CourseDetailInfo> courseDetailInfoList,
  }) = _CourseDetail;

  factory CourseDetail.fromJson(Map<String, Object?> json) =>
      _$CourseDetailFromJson(json);
}
