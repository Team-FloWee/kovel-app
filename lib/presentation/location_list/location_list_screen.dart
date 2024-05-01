import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';
import 'package:provider/provider.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen({super.key});

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<LocationListViewModel>().getCourseData()); //세트
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationListViewModel>(); //세트
    return viewModel.isLoading == true
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: CommonAppBar(title: '뷰모델 전체'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ContentTitle(
                      title: '추천코스',
                      withMore: true,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CategoryList(textdata: [
                      '전체',
                      '가족코스',
                      '나홀로코스',
                      '힐링코스',
                      '도보코스',
                      '캠핑코스',
                      '맛코스',
                    ]),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: viewModel.courseDetail
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: FavoriteImage(
                                      imagePath: e.imagePath, imageSize: 100),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ContentTitle(
                      title: '테마별 장소',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CategoryList(textdata: [
                      '전체',
                      '관광지',
                      '문화시설',
                      '축제공연행사',
                      '숙박',
                      '캠핑',
                      '맛'
                    ]),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: viewModel.tourDetail
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewModel.isLoading == true
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : FavoriteImage(
                                          imagePath: e.imagePath,
                                          imageSize: 145,
                                        ),
                                  SizedBox(width: 8),
                                  CommonText(
                                    badgeTitle: '음식점',
                                    title: e.title,
                                    tel: e.tel,
                                    address: e.address1,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
  }
}
