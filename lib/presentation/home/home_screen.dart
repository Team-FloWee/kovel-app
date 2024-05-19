import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/model/category/area_type.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
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
      context.read<HomeViewModel>().getProfile(context.read<UserProvider>().user);
      final viewModel = context.read<HomeViewModel>();
      final userProvider = context.read<UserProvider>();
      viewModel.onFetch(userProvider.user.language);
    });
    super.initState();
  }

  String _selectedRadius = '';

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final userProvider = context.watch<UserProvider>();

    // 드롭다운 리스트
    List<String> radiusList = ['1km', '3km', '5km', '10km'];

    // radius 초기값 설정
    if (_selectedRadius == '') {
      _selectedRadius = radiusList.first;
    }

    return Scaffold(
      appBar: AppBar(toolbarHeight: 16),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '${'안녕하세요,'.tr()}${userProvider.user.name}${'님!'.tr()}',
                            style: UiConfig.h4Style
                                .copyWith(fontWeight: UiConfig.semiBoldFont),
                          ),
                        ),
                      ],
                    ),
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
                                items: viewModel.locationList.map(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                                      ),
                                    );
                                  },
                                ).toList(),
                                value: viewModel.selectedLocation,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      viewModel.selectedLocation = value!;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '주소 새로고침'.tr(),
                              style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont, color: UiConfig.black.shade800),
                            ),
                            CustomIconButton(
                              icon: Icons.refresh_rounded,
                              onPressed: () {
                                viewModel.refreshPosition(_selectedRadius);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode()); // 현재 필드의 포커스를 해제합니다.
                        context.pushNamed('search');
                      },
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        hintText: '원하는 정보를 검색하세요'.tr(),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          '내주변 관광정보 추천'.tr(),
                          style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont),
                        ),
                        const Spacer(),
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            color: UiConfig.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.036,
                            width: MediaQuery.of(context).size.width * 0.22,
                            child: Center(
                              child: DropdownButton(
                                dropdownColor: UiConfig.primaryColor,
                                iconEnabledColor: UiConfig.black.shade100,
                                items: radiusList.map(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont, fontSize: 15.sp, color: UiConfig.black.shade100),
                                      ),
                                    );
                                  },
                                ).toList(),
                                value: _selectedRadius,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _selectedRadius = value!;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    viewModel.locationBasedList.isNotEmpty
                        ? GridView.count(
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
                                                ),
                                              )
                                            : Expanded(
                                                child: Text(
                                                  e.title,
                                                  style: UiConfig.bodyStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                                                ),
                                              ),
                                        Text(
                                          viewModel.distanceList[index] ?? '가까이 있음'.tr(),
                                          style: UiConfig.smallStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .values // MapEntry의 값들만 추출
                                .toList(),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Image.asset('assets/images/search_icon.png'),
                              ),
                              Text(
                                '현재 위치에는 관광정보가 없습니다.'.tr(),
                                style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade700, fontWeight: UiConfig.semiBoldFont),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            ],
                          ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    Row(children: [
                      Text(
                        '🧐 어디로 여행갈까?'.tr(),
                        style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 2 / 1,
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        AreaTypeList.typeList.length,
                        (index) => LocationSelector(
                          category: AreaTypeList.typeList[index],
                          onSelect: (Category selectedCategory) {
                            context.pushNamed(
                              'locationList',
                              queryParameters: {'areaCode': selectedCategory.id.toString()},
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Row(
                      children: [
                        Text('🔥 가장 인기 있는 명소 Top 10'.tr(), style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: 348,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: viewModel.popularTourList.length,
                    padding: const EdgeInsets.all(8.0),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => context.pushNamed('detail', queryParameters: {
                          'id': viewModel.popularTourList[index].contentId.toString(),
                          'contentTypeId': viewModel.popularTourList[index].contentType.contentTypeId.toString(),
                          'title': viewModel.popularTourList[index].contentType.name
                        }),
                        child: FavoriteImage(
                          archived: ArchivedUtil.getArchived(tourDetail: viewModel.popularTourList[index]),
                          imageSize: 160,
                          area: AreaType(areaCode: viewModel.popularTourList[index].areaCode).name,
                          title: viewModel.popularTourList[index].title,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text('🎉 진행중인 축제 모음'.tr(), style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont)),
                  ],
                ),
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
                        archived: ArchivedUtil.getArchived(tour: viewModel.onGoingTourList[index]),
                        tourData: viewModel.onGoingTourList[index],
                        onSelect: (Tour selectedTour) {
                          selectedTour.contentType.contentTypeId;
                          context.pushNamed(
                            'detail',
                            queryParameters: {'id': selectedTour.id.toString(), 'contentTypeId': selectedTour.contentType.contentTypeId.toString(), 'title': selectedTour.contentType.name},
                          );
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FloatingActionButton.extended(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: UiConfig.secondaryColor,
          icon: SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                Icons.smart_toy_outlined,
                color: UiConfig.black.shade800,
              )),
          label: Text('AI 톡톡'.tr(),
              style: UiConfig.h4Style.copyWith(
                  fontWeight: UiConfig.semiBoldFont,
                  color: UiConfig.black.shade800)),

          onPressed: () {
            context.push('/chatBot');
          },
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 0),
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
