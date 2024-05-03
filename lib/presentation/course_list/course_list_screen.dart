import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/category_item.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';
import 'package:kovel_app/presentation/course_list/course_reccommendation_list.dart';
import 'package:provider/provider.dart';

class CourseListScreen extends StatefulWidget {
  final String areaCode;

  const CourseListScreen({super.key, required this.areaCode});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => context.read<CourseListViewModel>().getData(widget.areaCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CourseListViewModel>();
    return viewModel.isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: const CommonAppBar(
              title: '전체 여행코스',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
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
                    const SizedBox(
                      height: 16,
                    ),
                    // CategoryList(textdata: [
                    //   '전체',
                    //   'C0112',
                    //   'C0113',
                    //   'C0114',
                    //   'C0115',
                    //   'C0116',
                    //   'C0117',
                    // ]),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          // children: widget.textdata
                          //     .map((e) => GestureDetector(onTap: onTapCourseData(e) ,child: CategoryItem(e,)))
                          //     .toList(),
                          children: viewModel.textdata
                              .map((e) => GestureDetector(
                                  onTap: () {
                                    viewModel.onTapCourseData(e);
                                  },
                                  child: CategoryItem(e)))
                              .toList(),
                        ), //This expression has a type of
                        // 'void' so its value can't be used. (Documentation)
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: viewModel.TourDetailData.map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CourseRecommendation(
                              url: e.imagePath,
                              course: '음식점',
                              title: e.title,
                              content: e.overview,
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
