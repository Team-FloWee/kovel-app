import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/plan_date.dart';
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

  final _scheduleRef =
      FirebaseFirestore.instance.collection('userPlan').withConverter<UserPlan>(
            fromFirestore: (snapshot, _) => UserPlan.fromJson(snapshot.data()!),
            toFirestore: (userPlan, _) => userPlan.toJson(),
          );

  Future<void> createPost({required String userId}) async {
    final newUserPlan = UserPlan(
      userId: userId,
      planList: [
        PlanDate(
          title: '제주',
          startDate: DateTime(2024, 5, 4),
          endDate: DateTime(2024, 5, 8),
          dateList: [ScheduleDate(day: 1, scheduleList: [])],
        ),
      ],
    );
    await _scheduleRef.add(newUserPlan).then((value) => print('성공'));
  }

  Future<UserPlan> getUserPlan({required String userId}) async {
    try {
      final scheduleDoc = await _scheduleRef.doc(userId).get();
      if (scheduleDoc.exists) {
        return scheduleDoc.data()!;
      } else {
        print('해당 유저의 일정을 찾을 수 없습니다.: $userId');
        final newUserPlan = UserPlan(
          userId: userId,
          planList: [
            PlanDate(
              title: '제주',
              startDate: DateTime(2024, 5, 4),
              endDate: DateTime(2024, 5, 8),
              dateList: [],
            ),
          ],
        );
        await _scheduleRef.doc(userId).set(newUserPlan);
        return newUserPlan;
      }
    } catch (e) {
      print('해당 유저의 일정을 불러올 수 없습니다.: $userId - $e');
      throw Exception('Failed to get or create UserPlan');
    }
  }
}
