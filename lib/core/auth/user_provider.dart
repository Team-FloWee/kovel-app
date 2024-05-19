import 'dart:convert';
import 'dart:core';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';
import 'package:kovel_app/domain/use_case/like_tour_use_case.dart';
import 'package:kovel_app/domain/use_case/unlike_tour_use_case.dart';

import '../../domain/model/archived.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository;
  final LikeTourUseCase _likeTourUseCase;
  final UnLikeTourUseCase _unLikeTourUseCase;

  UserProvider({
    required UserRepository userRepository,
    required LikeTourUseCase likeTourUseCase,
    required UnLikeTourUseCase unLikeTourUseCase,
  })  : _userRepository = userRepository,
        _likeTourUseCase = likeTourUseCase,
        _unLikeTourUseCase = unLikeTourUseCase;

  late User _user;
  User get user => _user;

  bool isArchived(int id) {
    return user.archivedList.any((element) => element.id == id);
  }

  Future<User> getUser() async {
    try {
      _user = await _userRepository.getUser(
          userId: auth.FirebaseAuth.instance.currentUser!.uid);
    } catch (error) {
      _user = const User(
        userId: '',
        name: '',
        email: '',
        imageUrl: '',
        language: 'ko',
        archivedList: [],
      );
    }
    notifyListeners();
    return user;
  }

  List<Archived> getArchived() {
    return (jsonDecode(user.archivedList.toString()) as List<dynamic>)
        .map((e) => Archived.fromJson(e))
        .toList();
  }

  Future<void> updateArchived(
      {required String userId, required List<Archived> archivedList}) async {
    await _userRepository.updateArchivedList(
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
