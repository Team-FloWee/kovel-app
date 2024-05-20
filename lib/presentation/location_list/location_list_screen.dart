import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/model/category/area_type.dart';
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

  const LocationListScreen({
    super.key,
    required this.areaCode,
  });

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final userProvider = context.read<UserProvider>();
      context.read<LocationListViewModel>().getData(widget.areaCode,
          LanguageUtil().getLanguage(userProvider.user.language));
    });
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
    final userProvider = context.read<UserProvider>();
    if (_commonDataScrollController.position.pixels ==
            _commonDataScrollController.position.maxScrollExtent &&
        !context.read<LocationListViewModel>().isCommonDataLoading) {
      context.read<LocationListViewModel>().fetchMoreCommonData(widget.areaCode,
          LanguageUtil().getLanguage(userProvider.user.language));
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationListViewModel>(); //세트
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: CommonAppBar(
        title: AreaType(areaCode: widget.areaCode).name,
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
                    userProvider.user.language == 'ko' ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: ContentTitle(
                            title: '추천 코스'.tr(),
                            withMore: true,
                            onTapMore: () {
                              context.pushNamed(
                                'courseList',
                                queryParameters: {'areaCode': widget.areaCode},
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CategoryList(
                            categoryData: CourseCategoryTypeList.typeList,
                            onSelect: (Category category) {
                              context
                                  .read<LocationListViewModel>()
                                  .getCourseData(
                                  widget.areaCode,
                                  category.id,
                                  userProvider.user.language
                              );

                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          controller: _courseDataScrollController,
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [
                                ...viewModel.courseDetailList.map(
                                      (e) => Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: InkWell(
                                      onTap: (){context.pushNamed('detail',queryParameters: {'id':e.contentId.toString(),'contentTypeId':e.contentType.id,'title':e.title},);},
                                      child: FavoriteImage(

                                        archived:
                                        ArchivedUtil.getArchived(tourDetail: e),
                                        imageSize: 100,
                                        area: AreaType(areaCode: e.areaCode).name,
                                        title: e.title,
                                      ),
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
                      ],
                    ) : const SizedBox(),
                    LocationCommonData(areaCode: widget.areaCode),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: viewModel.isCommonDataLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: UiConfig.primaryColor,
                              ),
                            )
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
    final userProvider = context.read<UserProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ContentTitle(
              title: '테마별 장소'.tr(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CategoryList(
                categoryData: ContentTypeList.getTypeList(userProvider.user.language),
                onSelect: (Category category) {
                  viewModel.selectCategory(int.parse(category.id));
                  context.read<LocationListViewModel>().getCommonData(
                        widget.areaCode,
                        int.parse(category.id ?? '0'),
                        LanguageUtil().getLanguage(userProvider.user.language),
                      );
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: viewModel.tourDetailList
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
                        ),
                      )
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
