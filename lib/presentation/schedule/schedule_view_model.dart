import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/plan.dart';
import 'package:kovel_app/domain/model/schedule.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/domain/model/user_plan.dart';
import 'package:kovel_app/domain/use_case/get_area_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_schedule_list_use_case.dart';
import 'package:kovel_app/domain/use_case/update_schedule_use_case.dart';

class ScheduleViewModel with ChangeNotifier {
  final GetScheduleListUseCase _getScheduleListUseCase;
  final UpdateScheduleUseCase _updateScheduleUseCase;
  final GetAreaDataUseCase _getAreaDataUseCase;
  ScheduleViewModel(
      {required GetScheduleListUseCase getScheduleListUseCase,
      required UpdateScheduleUseCase updateScheduleUseCase,
      required GetAreaDataUseCase getAreaDataUseCase})
      : _getScheduleListUseCase = getScheduleListUseCase,
        _updateScheduleUseCase = updateScheduleUseCase,
        _getAreaDataUseCase = getAreaDataUseCase;

  ScheduleDate? _scheduledate;
  List<Tour> _areadata = [];
  UserPlan? userPlan;

  ScheduleDate? get scheduledate => _scheduledate;
  List<Tour> get areadata => _areadata;

  Future<void> getAreaData() async {
    try {
      _areadata = await _getAreaDataUseCase.execute(
          areaCode: '39', cat2: 'B0201', contentTypeId: 32);
    } catch (e) {
      print('데이터 요청을 실패했습니다.');
    }
  }

  Schedule toSchedule({Tour? tour, TourDetail? tourDetail}) {
    return Schedule(
      id: tour?.id ?? tourDetail?.contentId ?? 0,
      contentType: tour?.contentType.contentTypeId ??
          tourDetail?.contentType.contentTypeId ??
          0,
      title: tour?.title ?? tourDetail?.title ?? '',
      mapx: tour?.mapx ?? tourDetail?.mapx ?? '',
      mapy: tour?.mapy ?? tourDetail?.mapy ?? '',
      imagePath: tour?.imagePath ?? tourDetail?.imagePath ?? '',
      tel: tour?.tel ?? tourDetail?.tel ?? '',
    );
  }

  Future<void> getScheduleList({required String userId}) async {
    userPlan = await _getScheduleListUseCase.execute(userId: userId);
    notifyListeners();
  }

  Future<void> updateSchedule(
      {required String userId, required Schedule schedule}) async {
    //UserPlan > Plan > ScheduleDate > Schedule
    UserPlan copyUserPlan = userPlan!;
    List<Plan> modifiablePlanList = List.from(copyUserPlan.planList);
    Plan copyPlan = modifiablePlanList.first;
    List<ScheduleDate> modifiableDateList = List.from(copyPlan.dateList);
    ScheduleDate copyScheduleDate = modifiableDateList.first;
    List<Schedule> modifiableScheduleList =
        List.from(copyScheduleDate.scheduleList);

    modifiableScheduleList.add(schedule);

    ScheduleDate updatedScheduleDate =
        copyScheduleDate.copyWith(scheduleList: modifiableScheduleList);

    int scheduleDateIndex = modifiableDateList.indexOf(copyScheduleDate);
    modifiableDateList[scheduleDateIndex] = updatedScheduleDate;

    Plan updatedPlan = copyPlan.copyWith(dateList: modifiableDateList);

    int planIndex = modifiablePlanList.indexOf(copyPlan);
    modifiablePlanList[planIndex] = updatedPlan;

    UserPlan updatedUserPlan =
        copyUserPlan.copyWith(planList: modifiablePlanList);

    await _updateScheduleUseCase.execute(
        userId: userId, planList: updatedUserPlan.planList);
    getScheduleList(userId: userId);
    notifyListeners();
  }
}
