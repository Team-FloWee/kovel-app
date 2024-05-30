import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kovel_app/data/data_source/schedule_data_source.dart';
import 'package:kovel_app/domain/model/schedule_date.dart';
import 'package:kovel_app/domain/model/user_plan.dart';

class ScheduleDataSourceImpl implements ScheduleDataSource {
  final _scheduleRef = FirebaseFirestore.instance
      .collection('userPlan')
      .withConverter<UserPlan>(
          fromFirestore: (snapshot, _) => UserPlan.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  // @override
  // Future<void> createUserPlan({required String userId}) async {
  //   await _scheduleRef.doc(userId).set(UserPlan(userId: userId, dateList: []));
  // }

  @override
  Future<void> getScheduleList({required String userId}) async {
    // final scheduleList =
    //     await _scheduleRef.doc(userId).get().then((s) => s.data()!);
    // return scheduleList;

    try {
      final scheduleDoc = await _scheduleRef.doc(userId).get();
      if (scheduleDoc.exists) {
        await scheduleDoc.data()!;
      } else {
        print('해당 유저의 일정을 찾을 수 없습니다.: $userId');
        await _scheduleRef
            .doc(userId)
            .set(UserPlan(userId: userId, dateList: []));
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
