import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/presentation/components/category_list.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
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
              child: ContentTitle(title: '추천코스', withMore: true,),
            ),
            SizedBox(height: 16,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CategoryList(textdata: ['전체', '가족코스', '나홀로코스', '힐링코스', '도보코스', '캠핑코스', '맛코스']),
            ),
            SizedBox(height: 16,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 100, height: 100, fit: BoxFit.fill,)),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 100, height: 100, fit: BoxFit.fill,)),
                  SizedBox(width: 8),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 100, height: 100, fit: BoxFit.fill,)),
                  SizedBox(width: 8),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 100, height: 100, fit: BoxFit.fill,)),
                  SizedBox(width: 8),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 100, height: 100, fit: BoxFit.fill,)),
                  SizedBox(width: 8),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ContentTitle(title: '테마별 장소',),
            ),
            SizedBox(height: 16,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFF00D1FF),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '전체',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282828),
                              letterSpacing: -0.3),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 16,),
            Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 145, height: 145, fit: BoxFit.fill,)),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Color(0xFF00D1FF),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                              child: Text(
                                '음식점',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: -0.3),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text('오리 주물럭 집',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16,),
                            SizedBox(width: 2,),
                            Text('010-1234-5678',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, size: 16,),
                            SizedBox(width: 2,),
                            Text('서울 관악구 관악시 11로 12길', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 145, height: 145, fit: BoxFit.fill,)),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Color(0xFF00D1FF),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                              child: Text(
                                '음식점',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: -0.3),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text('오리 주물럭 집',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16,),
                            SizedBox(width: 2,),
                            Text('010-1234-5678',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, size: 16,),
                            SizedBox(width: 2,),
                            Text('서울 관악구 관악시 11로 12길', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 145, height: 145, fit: BoxFit.fill,)),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Color(0xFF00D1FF),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                              child: Text(
                                '음식점',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: -0.3),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text('오리 주물럭 집',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16,),
                            SizedBox(width: 2,),
                            Text('010-1234-5678',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, size: 16,),
                            SizedBox(width: 2,),
                            Text('서울 관악구 관악시 11로 12길', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network('https://food.sarangbang.com/upload/board/image/20200925144925528104.jpg', width: 145, height: 145, fit: BoxFit.fill,)),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Color(0xFF00D1FF),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                              child: Text(
                                '음식점',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: -0.3),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text('오리 주물럭 집',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16,),
                            SizedBox(width: 2,),
                            Text('010-1234-5678',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, size: 16,),
                            SizedBox(width: 2,),
                            Text('서울 관악구 관악시 11로 12길', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -0.3),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
