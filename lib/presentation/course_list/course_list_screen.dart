import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';
import 'package:kovel_app/presentation/course_list/course_reccommendation_list.dart';
import 'package:provider/provider.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CourseListViewModel>().getCourseData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CourseListViewModel>();
    return Scaffold(
      appBar: CommonAppBar(
        title: '전체 여행코스',
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
              CategoryList(textdata: [
                '전체',
                '가족코스',
                '나홀로코스',
                '힐링코스',
                '도보코스',
                '캠핑코스',
                '맛코스',
              ]),
              SizedBox(
                height: 16,
              ),
              Column(
                children:
                  viewModel.TourDetailData.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CourseRecommendation(
                      url:
                      e.imagePath,
                      course: '음식점',
                      title: e.title,
                      content:
                      e.overview,
                    ),
                  )).toList(),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
