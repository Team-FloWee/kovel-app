import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/domain/model/category/course_category_type.dart';
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
        title: '여행코스'.tr(),
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
                  '추천코스'.tr(),
                  style: UiConfig.h3Style.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                    color: UiConfig.black.shade900,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CategoryList(
                  categoryData: CourseCategoryTypeList.typeList,
                  onSelect: (Category category) {
                    // 카테고리 가져오기
                    context
                        .read<CourseListViewModel>()
                        .getCourseData(widget.areaCode, category.id);
                  }),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: viewModel.courseDetailList
                    .map((e) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(
                              'detail', queryParameters: {
                            'id': e.contentId.toString(),
                            'contentTypeId': e.contentType.id,
                            'title': e.title});
                        },
                        child: CourseRecommendation(
                          tourDetail: e,
                        ),
                      ),
                    ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
