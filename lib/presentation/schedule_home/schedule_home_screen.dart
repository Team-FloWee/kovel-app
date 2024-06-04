import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/schedule_home/component/schedule_image_button.dart';

class ScheduleHomeScreen extends StatefulWidget {
  const ScheduleHomeScreen({super.key});

  @override
  State<ScheduleHomeScreen> createState() => _ScheduleHomeScreenState();
}

class _ScheduleHomeScreenState extends State<ScheduleHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '일정'),
      body: SafeArea(
        child: ListView.builder(
          // 유저 여행 일정 개수로 수정
          itemCount: 10,
          itemBuilder: (context, index) {
            return ScheduleImageButton(
              // 유저 여행 일정 정보로 수정
              imagePath:
                  'https://www.lottehotel.com/content/dam/lotte-hotel/lotte/jeju/overview/introduction/g-0807.jpg.thumb.768.768.jpg',
              title: '영월',
              date: 'YYYY년 MM월 DDdays',
              // 버튼 클릭 시 발생할 이벤트 작성 (화면 이동)
              onTap: () {
                print('click');
              },
            );
          },
        ),
      ),
    );
  }
}
