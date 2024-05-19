import 'dart:core';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/get_user_use_case.dart';
import 'package:kovel_app/domain/use_case/like_tour_use_case.dart';
import 'package:kovel_app/domain/use_case/unlike_tour_use_case.dart';
import 'package:kovel_app/domain/use_case/updat_archived_use_case.dart';

import '../../domain/model/archived.dart';

class UserProvider with ChangeNotifier {
  final GetUserUseCase _getUserUseCase;
  final UpdateArchivedUseCase _updateArchivedUseCase;
  final LikeTourUseCase _likeTourUseCase;
  final UnLikeTourUseCase _unLikeTourUseCase;

  UserProvider({
    required GetUserUseCase getUserUseCase,
    required UpdateArchivedUseCase updateArchivedUseCase,
    required LikeTourUseCase likeTourUseCase,
    required UnLikeTourUseCase unLikeTourUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _updateArchivedUseCase = updateArchivedUseCase,
        _likeTourUseCase = likeTourUseCase,
        _unLikeTourUseCase = unLikeTourUseCase;

  late User _user;
  User get user => _user;

  bool isArchived(int id) {
    return user.archivedList.any((element) => element.id == id);
  }

  Future<User> getUser() async {
    _user = await _getUserUseCase.execute(
        userId: auth.FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
    return user;
  }

  Future<void> updateArchived(
      {required String userId, required List<Archived> archivedList}) async {
    await _updateArchivedUseCase.execute(
        userId: userId, archivedList: archivedList);
  }

  void updateArchivedList(Archived clickedArchived) async {
    EasyDebounce.debounce('like_debounce', const Duration(milliseconds: 500),
        () {
      if (isArchived(clickedArchived.id) == false) {
        _likeTourUseCase.execute(id: clickedArchived.id);
        user.archivedList.add(clickedArchived);
        updateArchived(userId: user.userId, archivedList: user.archivedList);
        notifyListeners();
      } else {
        _unLikeTourUseCase.execute(id: clickedArchived.id);
        user.archivedList
            .removeWhere((archived) => archived.id == clickedArchived.id);
        updateArchived(userId: user.userId, archivedList: user.archivedList);
        notifyListeners();
      }
      notifyListeners();
    });
  }
}
