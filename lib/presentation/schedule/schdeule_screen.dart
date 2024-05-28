import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/schedule/component/schedule_appbar.dart';
import 'package:kovel_app/presentation/schedule/component/schedule_list.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  Set<Marker> markers = {}; // 마커 변수
  late KakaoMapController _mapController;
  @override
  Widget build(BuildContext context) {
    AuthRepository.initialize(
      appKey: dotenv.get('KAKAO_JAVASCRIPT_APP_KEY'),
    );

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
              SizedBox(
                width: double.infinity,
                height: 218,
                child: KakaoMap(
                  onMapCreated: ((controller) async {
                    _mapController = controller;

                    markers.add(Marker(
                      markerId: UniqueKey().toString(),
                      latLng: await _mapController.getCenter(),
                    ));

                    setState(() {});
                  }),
                  //맵타입 컨트롤러
                  // mapTypeControl: true,
                  // mapTypeControlPosition: ControlPosition.topRight,
                  //줌 + - 컨트롤러
                  zoomControl: true,
                  zoomControlPosition: ControlPosition.right,
                  markers: markers.toList(),
                  center: LatLng(37.3608681, 126.9306506),
                ),
              ),
              ScheduleAppbar(
                days: 'day1',
                dates: '5.4/토',
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
              ScheduleAppbar(
                days: 'day2',
                dates: '5.5/일',
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
                      side:
                          BorderSide(color: UiConfig.black.shade700, width: 1),
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
