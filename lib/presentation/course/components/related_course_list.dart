import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/course/components/related_course_item.dart';

class RelatedCourseList extends StatelessWidget {
  const RelatedCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentTitle(title: '🏃🏼‍♀️ 이 여행과 관련된 코스'),
        SizedBox(height: 16),
        RelatedCourseItem(
          imagePath: 'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
          title: '오리주물럭',
          overview: '국립중앙박물관은 22만점의 소장유물을 소장하고 있으며, 고고, 역사, 미술, 기증, 아시아 관련 문화재를 전시하는 상설 전시실과 다양한 전시가 가능하도록 가변성 있게 구성된 기획 전시실, 체험과 참여 학습을 통해 전시를 이해하도록 설계된 어린이 박물관, 박물관 야외정원을 이용하여 석탑 등 다양한 석조유물을 전시한 야외전시실로 이뤄진다.',
        ),
        RelatedCourseItem(
          imagePath: 'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
          title: '오리주물럭',
          overview: '국립중앙박물관은 22만점의 소장유물을 소장하고 있으며, 고고, 역사, 미술, 기증, 아시아 관련 문화재를 전시하는 상설 전시실과 다양한 전시가 가능하도록 가변성 있게 구성된 기획 전시실, 체험과 참여 학습을 통해 전시를 이해하도록 설계된 어린이 박물관, 박물관 야외정원을 이용하여 석탑 등 다양한 석조유물을 전시한 야외전시실로 이뤄진다.',
        ),
        RelatedCourseItem(
          imagePath: 'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
          title: '오리주물럭',
          overview: '국립중앙박물관은 22만점의 소장유물을 소장하고 있으며, 고고, 역사, 미술, 기증, 아시아 관련 문화재를 전시하는 상설 전시실과 다양한 전시가 가능하도록 가변성 있게 구성된 기획 전시실, 체험과 참여 학습을 통해 전시를 이해하도록 설계된 어린이 박물관, 박물관 야외정원을 이용하여 석탑 등 다양한 석조유물을 전시한 야외전시실로 이뤄진다.',
        )
      ],
    );
  }
}
