import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: ContentTitle(
                title: '추천 코스',
                withMore: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CategoryList(categoryData: CourseCategoryTypeList.typeList),
            ),
            const SizedBox(
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
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: ContentTitle(
                title: '테마별 장소',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CategoryList(categoryData: ContentTypeList.typeList,),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FavoriteImage(
                        imagePath:
                            'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                        imageSize: 145),
                    SizedBox(
                      width: 8,
                    ),
                    CommonText(
                        badgeTitle: '음식점',
                        title:
                            '오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FavoriteImage(
                        imagePath:
                            'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                        imageSize: 145),
                    SizedBox(
                      width: 8,
                    ),
                    CommonText(
                        badgeTitle: '음식점',
                        title:
                            '오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FavoriteImage(
                        imagePath:
                            'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                        imageSize: 145),
                    SizedBox(
                      width: 8,
                    ),
                    CommonText(
                        badgeTitle: '음식점',
                        title:
                            '오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FavoriteImage(
                        imagePath:
                            'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                        imageSize: 145),
                    const SizedBox(
                      width: 8,
                    ),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );

  }
}