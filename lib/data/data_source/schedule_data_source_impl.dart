import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kovel_app/data/data_source/schedule_data_source.dart';
import 'package:kovel_app/domain/model/plan.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/model/user_plan.dart';

class ScheduleDataSourceImpl implements ScheduleDataSource {
  final _scheduleRef = FirebaseFirestore.instance
      .collection('userPlan')
      .withConverter<UserPlan>(
          fromFirestore: (snapshot, _) => UserPlan.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  @override
  Future<void> createUserPlan({required String userId}) async {
    await _scheduleRef.doc(userId).set(
          UserPlan(
            userId: userId,
            planList: [
              Plan(
                  title: 'title',
                  startDate: DateTime(2024 - 06 - 03),
                  endDate: DateTime(2024 - 06 - 06),
                  dateList: [ScheduleDate(day: 1, scheduleList: [])])
            ],
          ),
        );
  }

  @override
  Future<UserPlan> getUserPlan({required String userId}) async {
    try {
      final scheduleDoc = await _scheduleRef.doc(userId).get();
      print(scheduleDoc);
      if (scheduleDoc.exists) {
        return await _scheduleRef.doc(userId).get().then((s) => s.data()!);
      } else {
        print('해당 유저의 일정을 찾을 수 없습니다.: $userId');
        createUserPlan(userId: userId);
        return await _scheduleRef.doc(userId).get().then((s) => s.data()!);
      }
    } catch (e) {
      print('해당 유저의 일정을 불러올 수 없습니다.: $userId - $e');
      throw Exception();
    }
  }

  @override
  Future<void> updateSchedule(
      {required String userId, required List<Plan> planList}) async {
    await _scheduleRef
        .doc(userId)
        .update({'planList': planList.map((e) => e.toJson())});
  }
}
