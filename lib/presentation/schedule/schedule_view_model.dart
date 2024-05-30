import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/schedule.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/model/tour.dart';
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
  List<ScheduleDate> _dateList = [];
  List<Tour> _areadata = [];

  ScheduleDate? get scheduledate => _scheduledate;
  List<ScheduleDate> get dateList => List.unmodifiable(_dateList);
  List<Tour> get areadata => List.unmodifiable(_areadata);

  Future<void> getAreaData() async {
    try {
      _areadata = await _getAreaDataUseCase.execute(
          areaCode: '39', cat2: 'B0201', contentTypeId: 32);
    } catch (e) {
      print('데이터 요청을 실패했습니다.');
    }
  }

  Schedule getSchedule({Tour? tour, TourDetail? tourDetail}) {
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
    await _getScheduleListUseCase.execute(userId: userId);
  }

  void updateSchedule(
      {required String userId, required Schedule schedule}) async {
    _scheduledate?.scheduleList.add(schedule);
    _dateList.add(_scheduledate!);
    await _updateScheduleUseCase.execute(userId: userId, dateList: _dateList);
  }
}
