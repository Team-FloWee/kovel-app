import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Container(
                    child: Image.network(
                      'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      'https://news.kbs.co.kr/data/fckeditor/new/image/2021/05/07/314691620354493423.jpg',
                      fit: BoxFit.cover,
                    ),
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
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 20,
                  width: 30,
                  color: Colors.blue,
                ),
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
                  Container(
                    color: Colors.blue,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 1')), // 데이터 1
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 2')), // 데이터 1
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 3')), // 데이터 1
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 4')), // 데이터 1
                  ),
                  Container(
                    color: Colors.green,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 5')), // 데이터 2
                  ),
                  Container(
                    color: Colors.green,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 6')), // 데이터 2
                  ),
                  Container(
                    color: Colors.green,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 7')), // 데이터 2
                  ),
                  Container(
                    color: Colors.green,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 8')), // 데이터 2
                  ),
                  Container(
                    color: Colors.green,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 9')), // 데이터 2
                  ),
                  Container(
                    color: Colors.green,
                    height: 200, // 내용의 높이
                    width: 200,
                    child: Center(child: Text('Data 10')), // 데이터 2
                  ),
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
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        height: 200, // 내용의 높이
                        width: 200,
                        child: Center(child: Text('Data 1')), // 데이터 1
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        height: 200, // 내용의 높이
                        width: 200,
                        child: Center(child: Text('Data 2')), // 데이터 1
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        height: 200, // 내용의 높이
                        width: 200,
                        child: Center(child: Text('Data 3')), // 데이터 1
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        height: 200, // 내용의 높이
                        width: 200,
                        child: Center(child: Text('Data 4')), // 데이터 1
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        height: 200, // 내용의 높이
                        width: 200,
                        child: Center(child: Text('Data 5')), // 데이터 1
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
