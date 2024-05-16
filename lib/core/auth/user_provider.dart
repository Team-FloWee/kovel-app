import 'dart:convert';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/like_tour_use_case.dart';
import 'package:kovel_app/domain/use_case/unlike_tour_use_case.dart';

import '../../domain/model/archived.dart';

class UserProvider with ChangeNotifier {
  // TODO : UseCase 생성자로 받기
  final LikeTourUseCase _likeTourUseCase;
  final UnLikeTourUseCase _unLikeTourUseCase;

  UserProvider({
    required LikeTourUseCase likeTourUseCase,
    required UnLikeTourUseCase unLikeTourUseCase,
  })  : _likeTourUseCase = likeTourUseCase,
        _unLikeTourUseCase = unLikeTourUseCase;

  late User user;

  final currentUser = auth.FirebaseAuth.instance.currentUser;
  final userRef = FirebaseFirestore.instance
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
      final data = await userRef
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
        language: 'ko',
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
    await userRef
        .doc(user.userId)
        .update({'archivedList': archivedList.map((e) => e.toJson())});
  }

  void updateArchivedList(Archived clickedArchived) async {
    EasyDebounce.debounce('like_debounce', Duration(milliseconds: 500), () {
      if (isArchived(clickedArchived.id) == false) {
        _likeTourUseCase.execute(id: clickedArchived.id);
        user.archivedList.add(clickedArchived);
        updateArchived(user.archivedList);
        notifyListeners();
      } else {
        _unLikeTourUseCase.execute(id: clickedArchived.id);
        user.archivedList
            .removeWhere((archived) => archived.id == clickedArchived.id);
        updateArchived(user.archivedList);
        notifyListeners();
      }
      notifyListeners();
    });
  }

  String getLanguage(String language) {
    switch (language) {
      case 'en':
        return 'EngService1';
      default:
        return 'KorService1';
    }
  }
}
