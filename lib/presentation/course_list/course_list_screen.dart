import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/course_list/course_reccommendation_list.dart';

import '../../core/enums/content_type.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '여행코스',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '추천코스',
                  style: UiConfig.h3Style.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                    color: UiConfig.black.shade900,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CategoryList(textdata: ContentType.values),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  CourseRecommendation(
                    url:
                        'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                    course: '음식점',
                    title: '서울 용산을 중심으로 알차게 하루 즐기기',
                    content:
                        '국립중앙박물관은 서울의 가장 볼거리가 많은 박물관 중의 하나이며 용산공원은 가족 나들이하기 좋은 공원이다. 주변에 전쟁기념관을 함께 둘러보고 저녁에는 남산서울타워에 올라 서울야경을 감상한다면 아주 즐거운 서울나들이가 될 것이다',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CourseRecommendation(
                    url:
                        'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                    course: '음식점',
                    title: '서울 용산을 중심으로 알차게 하루 즐기기',
                    content:
                        '국립중앙박물관은 서울의 가장 볼거리가 많은 박물관 중의 하나이며 용산공원은 가족 나들이하기 좋은 공원이다. 주변에 전쟁기념관을 함께 둘러보고 저녁에는 남산서울타워에 올라 서울야경을 감상한다면 아주 즐거운 서울나들이가 될 것이다',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CourseRecommendation(
                    url:
                        'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                    course: '음식점',
                    title: '서울 용산을 중심으로 알차게 하루 즐기기',
                    content:
                        '국립중앙박물관은 서울의 가장 볼거리가 많은 박물관 중의 하나이며 용산공원은 가족 나들이하기 좋은 공원이다. 주변에 전쟁기념관을 함께 둘러보고 저녁에는 남산서울타워에 올라 서울야경을 감상한다면 아주 즐거운 서울나들이가 될 것이다',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CourseRecommendation(
                    url:
                        'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                    course: '음식점',
                    title: '서울 용산을 중심으로 알차게 하루 즐기기',
                    content:
                        '국립중앙박물관은 서울의 가장 볼거리가 많은 박물관 중의 하나이며 용산공원은 가족 나들이하기 좋은 공원이다. 주변에 전쟁기념관을 함께 둘러보고 저녁에는 남산서울타워에 올라 서울야경을 감상한다면 아주 즐거운 서울나들이가 될 것이다',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CourseRecommendation(
                    url:
                        'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                    course: '음식점',
                    title: '서울 용산을 중심으로 알차게 하루 즐기기',
                    content:
                        '국립중앙박물관은 서울의 가장 볼거리가 많은 박물관 중의 하나이며 용산공원은 가족 나들이하기 좋은 공원이다. 주변에 전쟁기념관을 함께 둘러보고 저녁에는 남산서울타워에 올라 서울야경을 감상한다면 아주 즐거운 서울나들이가 될 것이다',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
