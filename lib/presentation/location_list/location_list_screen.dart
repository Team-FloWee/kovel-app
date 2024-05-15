import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/category/course_category_type.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';
import 'package:provider/provider.dart';

class LocationListScreen extends StatefulWidget {
  final String areaCode;

  const LocationListScreen({super.key, required this.areaCode});

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<LocationListViewModel>().getData(widget.areaCode);
      //Todo UserViewModel 안쓰면 지우고 작동확인 크..
    }); //세트
    Future.microtask(() =>
        context.read<LocationListViewModel>().getData(widget.areaCode)); //세트
    Future.microtask(() => _courseDataScrollController.addListener(() {
          _onCourseDataScroll();
        }));
    Future.microtask(() => _commonDataScrollController.addListener(() {
          _onCommonDataScroll();
        }));
  }

  final ScrollController _courseDataScrollController = ScrollController();
  final ScrollController _commonDataScrollController = ScrollController();

  @override
  void dispose() {
    _courseDataScrollController.removeListener(_onCourseDataScroll);
    _commonDataScrollController.removeListener(_onCommonDataScroll);
    _courseDataScrollController.dispose();
    _commonDataScrollController.dispose();
    super.dispose();
  }

  void _onCourseDataScroll() {
    if (_courseDataScrollController.position.pixels ==
            _courseDataScrollController.position.maxScrollExtent &&
        !context.read<LocationListViewModel>().isCourseDataLoading) {
      context
          .read<LocationListViewModel>()
          .fetchMoreCourseData(widget.areaCode);
    }
  }

  void _onCommonDataScroll() {
    if (_commonDataScrollController.position.pixels ==
            _commonDataScrollController.position.maxScrollExtent &&
        !context.read<LocationListViewModel>().isCommonDataLoading) {
      context
          .read<LocationListViewModel>()
          .fetchMoreCommonData(widget.areaCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationListViewModel>(); //세트
    return Scaffold(
      appBar: CommonAppBar(
        title: '뷰모델 전체',
        controller: _commonDataScrollController,
      ),
      body: SafeArea(
        child: viewModel.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                controller: _commonDataScrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: ContentTitle(
                        title: '추천 코스',
                        withMore: true,
                        onTapMore: () {
                          context.pushNamed('courseList',
                              queryParameters: {'areaCode': widget.areaCode});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CategoryList(
                          categoryData: CourseCategoryTypeList.typeList,
                          onSelect: (Category category) {
                            viewModel.selectCourseCategory(category.id);
                            context
                                .read<LocationListViewModel>()
                                .getCourseData(widget.areaCode, category.id);
                          }),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      controller: _courseDataScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            ...viewModel.courseDetailList.map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FavoriteImage(
                                  archived:
                                      ArchivedUtil.getArchived(tourDetail: e),
                                  imageSize: 100,
                                ),
                              ),
                            ),
                            viewModel.isCourseDataLoading == true
                                ? const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.0),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: UiConfig.primaryColor,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    LocationCommonData(areaCode: widget.areaCode),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: viewModel.isCommonDataLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: UiConfig.primaryColor,
                            ))
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class LocationCommonData extends StatefulWidget {
  final String areaCode;

  const LocationCommonData({
    super.key,
    required this.areaCode,
  });

  @override
  State<LocationCommonData> createState() => _LocationCommonDataState();
}

class _LocationCommonDataState extends State<LocationCommonData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationListViewModel>();

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: ContentTitle(
              title: '테마별 장소',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CategoryList(
                categoryData: ContentTypeList.typeList,
                onSelect: (Category category) {
                  viewModel.selectCategory(int.parse(category.id));
                  context.read<LocationListViewModel>().getCommonData(
                      widget.areaCode, int.parse(category.id ?? '0'));
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: viewModel.tourDetailList
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: InkWell(
                              onTap: () {
                                context.pushNamed('detail', queryParameters: {
                                  'id': e.contentId.toString(),
                                  'contentTypeId': e.contentType.id,
                                  'title': e.title
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewModel.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : FavoriteImage(
                                          archived: ArchivedUtil.getArchived(
                                              tourDetail: e),
                                          imageSize: 145,
                                        ),
                                  const SizedBox(width: 8),
                                  CommonText(
                                    badgeTitle: e.contentType.name,
                                    title: e.title,
                                    tel: e.tel,
                                    address: e.address1,
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
