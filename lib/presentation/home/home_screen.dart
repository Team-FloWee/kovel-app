import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/presentation/components/location_selector.dart';
import 'package:kovel_app/presentation/components/nearby_tourist_information_recommendations.dart';
import 'package:kovel_app/presentation/components/ongoing_festivals.dart';
import 'package:kovel_app/presentation/components/top_10_popular_landmarks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈 화면')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                  labelText: '검색하세요', border: OutlineInputBorder()),
            ),
            Row(
              children: [
                Text(
                  '내주변 관광정보 추천',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // 진하게 설정
                  ),
                ),
                Spacer(),
                Text('드롭다운')
              ],
            ),
            Container(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 3 / 1,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  NearbyTouristInformation(
                    url:
                        'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                  ),
                  NearbyTouristInformation(
                    url:
                        'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                  ),
                  NearbyTouristInformation(
                    url:
                        'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                  ),
                  NearbyTouristInformation(
                    url:
                        'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                  ),
                  NearbyTouristInformation(
                    url:
                        'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                  ),
                  NearbyTouristInformation(
                    url:
                        'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                  ),
                ],
              ),
            ),
            Row(children: [
              Text(
                '어디로 여행갈까',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // 진하게 설정
                ),
              ),
            ]),
            Container(
                child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 3 / 1,
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
              children: [
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
            Row(children: [
              Text(
                '가장 인기 있는 명소 탑 10',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // 진하게 설정
                ),
              ),
            ]),
            Container(
              height: 300,
              child: GridView.count(
                padding: EdgeInsets.all(8.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                children: [
                  Top10PopularLandmarks(text: 'data1'),
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
            Row(children: [
              Text(
                '진행중인 축제 모음 (곧 시작하는 축제)',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // 진하게 설정
                ),
              ),
            ]),
            Container(
              height: 150,
              child: GridView.count(
                padding: EdgeInsets.all(8.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                crossAxisCount: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                children: [
                  OngoingFestivals(text: 'data1'),
                  OngoingFestivals(text: 'data2'),
                  OngoingFestivals(text: 'data3'),
                  OngoingFestivals(text: 'data4'),
                  OngoingFestivals(text: 'data5'),
                  OngoingFestivals(text: 'data6'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
