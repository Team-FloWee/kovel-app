import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

extension ToContentDetail on ContentDetailDto {
  CourseDetail toCourseDetail() {
    return CourseDetail(
        takeTime: taketime ?? '',
        distance: distance ?? '',
    );
  }
}