import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '강남'),
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
                '맛코스'
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
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(width: 8),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(width: 8),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(width: 8),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(width: 8),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(width: 8),
                  ],
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
              child: CategoryList(
                  textdata: ['전체', '관광지', '문화시설', '축제공연행사', '숙박', '캠핑', '맛']),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(children: [
                Row(
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
                            '오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
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
                            '오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
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
                            '오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
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
                            '오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
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
                            '오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집오리 주물럭 집',
                        tel: '010-1234-5678',
                        address: '서울 관악구 관악시 11로 12길'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ]),
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
