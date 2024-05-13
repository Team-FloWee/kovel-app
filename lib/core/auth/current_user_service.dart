import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/user.dart';

class UserProvider {
  late User user;

  final currentUser = auth.FirebaseAuth.instance.currentUser;
  final _userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  String getUserId() {
    if (currentUser != null) {
      return currentUser!.uid;
    } else {
      return '';
    }
  }

  Future<User> getUser() async {
    try {
      final data = await _userRef
          .doc(UserProvider().getUserId())
          .get()
          .then((s) => s.data()!);
      user = User.fromJson(data as Map<String, dynamic>);
    } catch (error) {
      user = const User(
        userId: '',
        name: '',
        email: '',
        imageUrl: '',
        archivedList: [],
      );
    }
    return user;
  }

  List<Archived> getArchived() {
    return (jsonDecode(user.archivedList.toString()) as List<dynamic>)
        .map((e) => Archived.fromJson(e))
        .toList();
  }

  Future<void> updateArchived(List<Archived> archivedList) async {
    print(user.userId);
    await _userRef
        .doc(user.userId)
        .update({'archivedList': archivedList.map((e) => jsonEncode(e))});
  }
}
