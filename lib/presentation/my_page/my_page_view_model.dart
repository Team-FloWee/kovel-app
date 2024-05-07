import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    //instance.me = 유저.토큰
    //DocumentSnapshot docSnap = userRef.doc(id).get();
    FirebaseAuth.instance.currentUser?.uid;
    notifyListeners();
  }
}

class User {
  String userId;
  String name;
  String email;
  String imageUrl;

  //토큰 토큰;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.imageUrl,
  });
  Map<String, dynamic> toJson() {
    return {
      'userId': this.userId,
      'name': this.name,
      'email': this.email,
      'imageUrl': this.imageUrl,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '메일 없음';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://i.namu.wiki/i/R0AhIJhNi8fkU2Al72pglkrT8QenAaCJd1as-d_iY6MC8nub1iI5VzIqzJlLa-1uzZm--TkB-KHFiT-P-t7bEg.webp';
  }
}
