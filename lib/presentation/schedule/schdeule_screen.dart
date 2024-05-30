import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/schedule/component/schedule_appbar.dart';
import 'package:kovel_app/presentation/schedule/component/schedule_list.dart';
import 'package:kovel_app/presentation/schedule/schedule_view_model.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  Set<Marker> markers = {}; // 마커 변수
  late KakaoMapController _mapController;
  List<CustomOverlay> customOverlays = [];
  int index = 5;

  @override
  void initState() {
    Future.microtask(() => context
        .read<ScheduleViewModel>()
        .getScheduleList(userId: context.read<UserProvider>().user.userId));
    Future.microtask(() => context.read<ScheduleViewModel>().getAreaData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final viewModel = context.watch<ScheduleViewModel>();
    AuthRepository.initialize(
      appKey: dotenv.get('KAKAO_JAVASCRIPT_APP_KEY'),
    );
    List<CustomOverlay> buildCustomOverlays(List<Archived> scheduleList) {
      return List.generate(userProvider.user.scheduleList.length, (index) {
        var content =
            '<div style="position: relative;width:23px;height:23px;top:50px;left:50px;">'
            '<div style="position: absolute;left: 0;top: 0;color: #fff;width: 23px;height: 23px;text-align: center;transform: translate(0%, 4px);z-index: 10;">${index + 1}</div>'
            '<div style="position: absolute;width:23px;height:23px;left:0px;bottom: 0px;border-radius: 50% 50% 50% 0;transform-origin: 50% 50%;transform: rotate(-45deg);background-color:#866eff;">'
            '</div>'
            '</div>';
        return CustomOverlay(
          customOverlayId: 'customOverlay_$index',
          latLng: LatLng(
              double.parse(userProvider.user.scheduleList[index].mapy),
              double.parse(userProvider.user.scheduleList[index].mapx)),
          content: content,
        );
      });
    }

    customOverlays = buildCustomOverlays(userProvider.user.scheduleList);

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

                    setState(() {});
                  }),
                  //줌 + - 컨트롤러
                  zoomControl: true,
                  zoomControlPosition: ControlPosition.right,
                  //커스텀오버레이(마커처럼생긴것)
                  customOverlays: customOverlays,
                  //커스텀오버레이 클릭시 콜백함수
                  onCustomOverlayTap: (String id, LatLng latLng) {
                    debugPrint('***** [callback2] $id / $latLng');
                  },
                  //화면 가운데
                  center: LatLng(37.49887, 127.026581),
                  //zoom단계
                  currentLevel: 10,
                ),
              ),
              ScheduleAppbar(
                days: 'day1',
                dates: '5.4/토',
              ),
              ...userProvider.user.scheduleList.mapIndexed(
                (index, e) => ScheduleList(
                  index: (index + 1).toString(),
                  isSelected: true,
                  archived: e,
                ),
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
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...viewModel.areadata
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                viewModel.updateSchedule(
                                    userId: userProvider.user.userId,
                                    schedule: viewModel.getSchedule(tour: e));
                              },
                              child: CommonText(
                                badgeTitle: e.contentType.name,
                                title: e.title,
                                tel: e.tel,
                                address: e.address1,
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNaviBar(selectedIndex: 2),
    );
  }
}
