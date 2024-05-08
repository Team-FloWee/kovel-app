import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/user.dart';

class MyPageViewModel with ChangeNotifier {
  final userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  void setProfile() async {
    DocumentReference userDoc = userRef.doc();
    await userDoc.set(User(
            userId: userDoc.id,
            name: "test",
            email: "test@test",
            imageUrl: "imageUrl")
        .toJson());
    notifyListeners();
  }

  void getProfile() async {
    final User user =
        await userRef.doc('0FPrtfSJJDjR5xnbXdoK').get().then((s) => s.data()!);
    print(user.email);
    notifyListeners();
  }
}
