import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';

import 'package:kovel_app/domain/model/category/area_type.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/domain/model/tour.dart';

import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/home/components/location_selector.dart';
import 'package:kovel_app/presentation/home/components/ongoing_festivals.dart';
import 'package:kovel_app/presentation/home/components/top_10_popular_landmarks.dart';
import 'package:kovel_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      viewModel.onFetch();
    });
    super.initState();
  }

  String _selectedRadius = '';
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    int selectedIndex = 0;
    // 드롭다운 리스트
    List<String> radiusList = ['1km', '3km', '5km', '10km']; // TODO: 따로 모아야할까요

    // radius 초기값 설정
    if (_selectedRadius == '') {
      _selectedRadius = radiusList.first;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Image.asset('assets/images/summer.png'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            DropdownButton(
                                items: viewModel.locationList.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                                    ),
                                  );
                                }).toList(),
                                value: viewModel.selectedLocation,
                                onChanged: (value) {
                                  setState(() {
                                    viewModel.selectedLocation = value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '주소 새로고침',
                            style: UiConfig.smallStyle,
                          ),
                          CustomIconButton(
                            icon: Icons.refresh,
                            onPressed: () {
                              viewModel.refreshPosition(_selectedRadius);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onFieldSubmitted: (value) {},
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD7D7D7),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      hintText: "원하는 정보를 검색하세요",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 14.0), //TODO: hintText 오른족으로 조금 옮기는 방법?
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('내주변 관광정보 추천', style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont)),
                      const Spacer(),
                      DecoratedBox(
                        decoration: const BoxDecoration(color: UiConfig.primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.23,
                          child: Center(
                            child: DropdownButton(
                                dropdownColor: UiConfig.primaryColor, //TODO: dropdown 밖의 색과 선택했을 때의 배경색이 같이 감. border radius 주는 방법?
                                iconEnabledColor: UiConfig.black.shade100,
                                items: radiusList.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont, fontSize: 15.sp, color: UiConfig.black.shade100),
                                    ),
                                  );
                                }).toList(),
                                value: _selectedRadius,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRadius = value!;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 3 / 1,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: viewModel.locationBasedList
                            .asMap() // locationBasedList를 Map으로 변환하여 인덱스와 요소에 접근
                            .map(
                              (index, e) => MapEntry(
                                index,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    e.title.length > 10
                                        ? Expanded(
                                            child: Text(
                                            '${e.title.substring(0, 10)}...',
                                            style: UiConfig.bodyStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                                          ))
                                        : Expanded(
                                            child: Text(
                                              e.title,
                                              style: UiConfig.bodyStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                                            ),
                                          ),
                                    Text(
                                      '${viewModel.distanceList[index][e.id] ?? '가까이 있음'}',
                                      style: UiConfig.smallStyle,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .values // MapEntry의 값들만 추출
                            .toList()),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(children: [
                    Text(
                      '어디로 여행갈까?',
                      style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont),
                    ),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Container(
                      child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2 / 1,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    children: List.generate(
                        AreaTypeList.typeList.length,
                        (index) => LocationSelector(
                              category: AreaTypeList.typeList[index],
                              onSelect: (Category selectedCategory) {
                                context.pushNamed('locationList', queryParameters: {'areaCode': selectedCategory.id});
                              },
                            )),
                  )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(children: [
                    Text('🔥 가장 인기 있는 명소 Top 10', style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont)),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 300,
                child: GridView.count(
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  children: const [
                    Top10PopularLandmarks(text: 'data1'), //TODO: radius 줄지
                    Top10PopularLandmarks(text: 'data2'),
                    Top10PopularLandmarks(text: 'data3'),
                    Top10PopularLandmarks(text: 'data4'),
                    Top10PopularLandmarks(text: 'data5'),
                    Top10PopularLandmarks(text: 'data6'),
                    Top10PopularLandmarks(text: 'data7'),
                    Top10PopularLandmarks(text: 'data8'),
                    Top10PopularLandmarks(text: 'data9'),
                    Top10PopularLandmarks(text: 'data10'),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                Text('🎉 진행중인 축제 모음', style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont)),
              ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 230,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 0,
                  children: List.generate(
                    viewModel.onGoingTourList.length,
                    (index) => OngoingFestivals(
                      tourData: viewModel.onGoingTourList[index],
                      onSelect: (Tour selectedTour) {
                        context.pushNamed('detail', queryParameters: {
                          'areaCode': selectedTour.areaCode,
                          'id': selectedTour.id.toString(),
                          'contentTypeId': selectedTour.contentType.contentTypeId.toString(),
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}
