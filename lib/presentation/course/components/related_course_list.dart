import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/course/components/related_course_item.dart';

class RelatedCourseList extends StatelessWidget {
  final List<CourseDetailInfo> courseDetailInfoData;
  const RelatedCourseList({super.key, required this.courseDetailInfoData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentTitle(title: '🏃🏼‍♀️ 이 여행과 관련된 코스'),
        SizedBox(height: 16),
        Column(
          children: courseDetailInfoData.mapIndexed(
                  (index, element) => RelatedCourseItem(info: element))
              .toList()
        ),
      ],
    );
  }
}
