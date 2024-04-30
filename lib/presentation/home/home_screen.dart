import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/location_selector.dart';
import 'package:kovel_app/presentation/components/nearby_tourist_information_recommendations.dart';
import 'package:kovel_app/presentation/components/ongoing_festivals.dart';
import 'package:kovel_app/presentation/components/top_10_popular_landmarks.dart';
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
    super.initState();
  }

  String _selectedLocation = '';
  String _selectedRadius = '';
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    // 드롭다운 리스트
    List<String> locationList = ['경기도 고양시 일산동구', '2', '3'];
    List<String> radiusList = ['1km', '3km', '5km'];

    // 위치 초기값 설정
    if (_selectedRadius == "") {
      _selectedRadius = radiusList.first;
    }
    // radius 초기값 설정
    if (_selectedLocation == "") {
      _selectedLocation = locationList.first;
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
                                items: locationList.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                                    ),
                                  );
                                }).toList(),
                                value: _selectedLocation,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    _selectedLocation = value!;
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
                              viewModel.determinePosition();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onFieldSubmitted: (value) {},
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
                      DropdownButton(
                          items: radiusList.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: UiConfig.smallStyle.copyWith(fontWeight: UiConfig.semiBoldFont),
                              ),
                            );
                          }).toList(),
                          value: _selectedRadius,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              _selectedRadius = value!;
                            });
                          }),
                    ],
                  ),
                  Container(
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 3 / 1,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: const [
                        NearbyTouristInformation(
                          url: 'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                        ),
                        NearbyTouristInformation(
                          url: 'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                        ),
                        NearbyTouristInformation(
                          url: 'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                        ),
                        NearbyTouristInformation(
                          url: 'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                        ),
                        NearbyTouristInformation(
                          url: 'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                        ),
                        NearbyTouristInformation(
                          url: 'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(children: [
                    Text(
                      '어디로 여행갈까?',
                      style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont),
                    ),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                      child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2 / 1,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    children: const [
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                      LocationSelector(),
                    ],
                  )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(children: [
                    Text('🔥 가장 인기 있는 명소 Top 10', style: UiConfig.h3Style.copyWith(color: UiConfig.black, fontWeight: UiConfig.semiBoldFont)),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 150,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 0,
                  children: const [
                    OngoingFestivals(text: 'data1'),
                    OngoingFestivals(text: 'data2'),
                    OngoingFestivals(text: 'data3'),
                    OngoingFestivals(text: 'data4'),
                    OngoingFestivals(text: 'data5'),
                    OngoingFestivals(text: 'data6'),
                    OngoingFestivals(text: 'data7'),
                    OngoingFestivals(text: 'data8'),
                    OngoingFestivals(text: 'data9'),
                    OngoingFestivals(text: 'data10'),
                  ],
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
