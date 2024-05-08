import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/detail/components/course/related_course_item.dart';

class RelatedCourseList extends StatelessWidget {
  final List<UnifiedInfo> courseInfoData;

  const RelatedCourseList({super.key, required this.courseInfoData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentTitle(title: '🏃🏼‍♀️ 이 여행과 관련된 코스'),
        SizedBox(height: 16),
        Column(
          children: courseInfoData.mapIndexed(
                  (index, element) => RelatedCourseItem(info: element))
              .toList()
        ),
      ],
    );
  }
}
