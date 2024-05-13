import 'dart:convert';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/user.dart';

import '../../domain/model/archived.dart';

class UserProvider with ChangeNotifier {


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

  bool isArchived(int id) {
    return user.archivedList.any((element) => element.id == id);
  }

  Future<User> getUser() async {
    try {
      final data = await _userRef
          .doc(auth.FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((s) => s.data()!);

      user = data;
      print(data);
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
    await _userRef
        .doc(user.userId)
        .update({'archivedList': archivedList.map((e) => e.toJson())});
  }

  void updateArchivedList(Archived clickedArchived) async {
    if (isArchived(clickedArchived.id) == false) {
      user.archivedList.add(clickedArchived);
      await updateArchived(user.archivedList);
      notifyListeners();
    } else {
      user.archivedList
          .removeWhere((archived) => archived.id == clickedArchived.id);
      await updateArchived(user.archivedList);
      notifyListeners();
    }
    notifyListeners();
  }
}
