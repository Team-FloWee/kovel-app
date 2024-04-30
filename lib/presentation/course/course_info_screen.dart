import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/info_text.dart';
import 'package:kovel_app/presentation/course/components/course_detail_text.dart';
import 'package:kovel_app/presentation/course/components/related_course_list.dart';

class CourseInfoScreen extends StatelessWidget {
  const CourseInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '안녕하세요'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CourseDetailText(
                    badgeTitle: '나홀로코스',
                    title: '오리주물럭오리주물럭오리주물럭오리주물럭오리주물럭오리주물럭오리주물럭오리주물럭',
                    overview: '국립중앙박물관은 서울의 가장 볼거리가 많은 박물관 중의 하나이며 용산공원은 가족 나들이하기 좋은 공원이다. 주변에 전쟁기념관을 함께 둘러보고 저녁에는 남산서울타워에 올라 서울야경을 감상한다면 아주 즐거운 서울나들이가 될 것이다."',
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: UiConfig.black.shade500,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        InfoText(title: '인포텍스트', contents: '15.21km'),
                        InfoText(title: '인포텍스트', contents: '15.21km'),
                        InfoText(title: '인포텍스트', contents: '15.21km'),
                      ],
                    )
                  ),
                  SizedBox(height: 16),
                  Divider(height: 1, color: UiConfig.black.shade500),
                  SizedBox(height: 16),
                  RelatedCourseList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
