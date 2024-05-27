import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/schedule/component/schedule_list.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '나의 일정',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '제주 여행',
                          style: UiConfig.h2Style.copyWith(
                            fontWeight: UiConfig.semiBoldFont,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '편집',
                          style: UiConfig.extraSmallStyle.copyWith(
                            color: UiConfig.black.shade700,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '2024.5.4 ~ 6.1.',
                      style: UiConfig.smallStyle.copyWith(
                        fontWeight: UiConfig.semiBoldFont,
                        color: UiConfig.black.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/login_background.png'),
              AppBar(
                title: Row(
                  children: [
                    Text(
                      'day1',
                      style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      '5.4/토',
                      style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade700),
                    ),
                  ],
                ),
                actions: [
                  Text(
                    '편집',
                    style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade700),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              ScheduleList(
                index: '1',
                isSelected: true,
              ),
              ScheduleList(
                index: '2',
                isSelected: false,
              ),
              ScheduleList(
                index: '3',
                isSelected: false,
              ),
              ScheduleList(
                index: '1',
                isSelected: true,
              ),
              ScheduleList(
                index: '2',
                isSelected: false,
              ),
              ScheduleList(
                index: '3',
                isSelected: false,
              ),
              SizedBox(height: 18.h),
              Center(
                child: SizedBox(
                  width: 152.w,
                  height: 32.h,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: UiConfig.black.shade700, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      '장소 추가',
                      style: UiConfig.smallStyle.copyWith(
                        color: UiConfig.black.shade900,
                        fontWeight: UiConfig.semiBoldFont,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNaviBar(selectedIndex: 0),
    );
  }
}
