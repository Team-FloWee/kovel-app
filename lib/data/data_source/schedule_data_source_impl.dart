import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kovel_app/data/data_source/schedule_data_source.dart';
import 'package:kovel_app/domain/model/plan_date.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/model/user_plan.dart';

class ScheduleDataSourceImpl implements ScheduleDataSource {
  final _scheduleRef = FirebaseFirestore.instance
      .collection('userPlan')
      .withConverter<UserPlan>(
          fromFirestore: (snapshot, _) => UserPlan.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  @override
  Future<void> getScheduleList({required String userId}) async {
    try {
      final scheduleDoc = await _scheduleRef.doc(userId).get();
      if (scheduleDoc.exists) {
        await _scheduleRef.doc(userId).get().then((s) => s.data()!);
      } else {
        print('해당 유저의 일정을 찾을 수 없습니다.: $userId');
        await _scheduleRef.doc(userId).set(
              UserPlan(userId: userId, planList: [
                PlanDate(
                  title: '제주',
                  startDate: DateTime(2024, 5, 4),
                  endDate: DateTime(2024, 5, 8),
                  dateList: [ScheduleDate(day: 1, scheduleList: [])],
                )
              ]),
            );
      }
    } catch (e) {
      print('해당 유저의 일정을 불러올 수 없습니다.: $userId - $e');
      throw Exception();
    }
  }

  @override
  Future<void> updateSchedule(
      {required String userId, required List<ScheduleDate> dateList}) async {
    await _scheduleRef
        .doc(userId)
        .update({'dateList': dateList.map((date) => date.toJson())});
  }
}
