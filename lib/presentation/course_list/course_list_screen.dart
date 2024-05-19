import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/domain/model/category/course_category_type.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';
import 'package:kovel_app/presentation/course_list/course_reccommendation.dart';
import 'package:provider/provider.dart';

class CourseListScreen extends StatefulWidget {
  final String areaCode;

  const CourseListScreen({super.key, required this.areaCode});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  final ScrollController _courseListDataScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => context.read<CourseListViewModel>().getData(widget.areaCode),
    );

    Future.microtask(() => _courseListDataScrollController.addListener(() {
          _onCourseListDataScroll();
        }));
  }

  @override
  void dispose() {
    _courseListDataScrollController.removeListener(_onCourseListDataScroll);
    _courseListDataScrollController.dispose();
    super.dispose();
  }

  void _onCourseListDataScroll() {
    if (_courseListDataScrollController.position.pixels ==
            _courseListDataScrollController.position.maxScrollExtent &&
        !context.read<CourseListViewModel>().isCourseListDataLoading) {
      context
          .read<CourseListViewModel>()
          .fetchMoreCourseListData(widget.areaCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CourseListViewModel>();
    return Scaffold(
      appBar: CommonAppBar(
        title: '여행코스'.tr(),
      ),
      body: viewModel.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              controller: _courseListDataScrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 16),
                    CategoryList(
                      categoryData: CourseCategoryTypeList.typeList,
                      onSelect: (Category category) {
                        viewModel.selectCourseCategory(category.id);
                        // 카테고리 가져오기
                        context
                            .read<CourseListViewModel>()
                            .getCourseData(widget.areaCode, category.id);
                      },
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: viewModel.courseDetailList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                onTap: () {
                                  context.pushNamed(
                                    'detail',
                                    queryParameters: {
                                      'id': e.contentId.toString(),
                                      'contentTypeId': e.contentType.id,
                                      'title': e.title
                                    },
                                  );
                                },
                                child: CourseRecommendation(tourDetail: e),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    viewModel.isCourseListDataLoading != true
                        ? const SizedBox()
                        : const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: UiConfig.primaryColor,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
