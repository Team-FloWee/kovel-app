import 'package:flutter/material.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class MyPageViewModel with ChangeNotifier {
  final UserRepository _userRepository;

  MyPageViewModel({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> updateLanguage(
      {required String lang, required String userId}) async {
    lang = LanguageUtil().getLanguage(lang);
    await _userRepository.updateLanguage(lang: lang, userId: userId);
    notifyListeners();
  }

  Future<void> updateName(
      {required String userId, required String name}) async {
    await _userRepository.updateUserName(userId: userId, name: name);
    notifyListeners();
  }

  Future<void> updatePhoto({required String userId}) async {
    await _userRepository.updatePhoto(userId: userId);
    notifyListeners();
  }

  Future<void> logout() async {
    await _userRepository.signOut();
    notifyListeners();
  }
}
