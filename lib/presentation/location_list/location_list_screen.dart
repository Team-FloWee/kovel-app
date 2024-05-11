import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    Future.microtask(() =>
        context.read<LocationListViewModel>().getData(widget.areaCode)); //세트
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationListViewModel>(); //세트
    return viewModel.isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: const CommonAppBar(title: '뷰모델 전체'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
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
                          context
                              .read<LocationListViewModel>()
                              .getCourseData(widget.areaCode, category.id);
                        }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: viewModel.courseDetailList
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: FavoriteImage(
                                      archived: ArchivedUtil.getArchived(
                                          tourDetail: e),
                                      imageSize: 100,
                                    onFavoriteChanged: (archived, isLiked) {
                                      // 여기에서 아무 작업도 하지 않아도 됩니다.
                                      // 콜백 함수는 이미지 위젯에서만 상태를 업데이트하는 역할을 합니다.
                                    },
                                    upDateArchivedList: viewModel.updateArchivedList,
                                    ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  LocationCommonData(areaCode: widget.areaCode)
                ],
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
                                          onFavoriteChanged:
                                              (Archived, isLiked) {},
                                          upDateArchivedList:
                                              viewModel.updateArchivedList,
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
