import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/enums/content_type.dart';

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
                      title: '추천 코스',
                      withMore: true,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CategoryList(textdata: ContentType.values),
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
                  LocationCommonData(areaCode: widget.areaCode)
                ],
              ),
            ),
          );
  }
}

class LocationCommonData extends StatefulWidget {
  final String areaCode;

  const LocationCommonData(
      {super.key, required this.areaCode,});

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
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ContentTitle(
                  title: '테마별 장소',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  CategoryList(textdata: ContentType.values),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: viewModel.tourDetail
                          .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            viewModel.isLoading
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

//해야할 일 스테이트풀 위젯 두개로 나누기 하나는 코스가 포함된 위젯, 두번쨰는 commondetail 이 포함된 위젯
//initstate할때 세가지 메서드중에서 getData메서드를 사용하여 코스추천메서드와 테마별여행메서드를 동시에 호출
// 뱃지를 누를때마다 해달 섹션만 로딩 할 수 있도록 코스추천메서드와 테마별여행메서드 각자 사용하게 함
//코스추천에서 지역만을 받는게 있고 contentTyprId/ cat2를 받아야하는게 있는데 어떤식으로 구성할지 고려해야 함
