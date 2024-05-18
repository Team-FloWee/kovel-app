import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';

class MyPageViewModel with ChangeNotifier {
  final UserRepository _userRepository;
  final _picker = ImagePicker();
  final _userId = auth.FirebaseAuth.instance.currentUser!.uid;
  //Todo uid 가져와도될지 세훈님 문의
  final _userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());
  MyPageViewModel({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> getProfile() async {
    await _userRepository.getUser();
  }

  Future<void> updateLanguage(String lang) async {
    lang = LanguageUtil().getLanguage(lang);
    await _userRepository.updateLanguage(lang);
    getProfile();
    notifyListeners();
  }

  Future<void> updateName(String name) async {
    await _userRepository.updateUserName(name: name);
    getProfile();
    notifyListeners();
  }

  Future<void> updatePhoto() async {
    await _userRepository.updatePhoto();
    getProfile();
    notifyListeners();
  }

  Future<void> updatePhoto2() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      //이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('user/${_userId}/profile/profile.png');

      //이미지 다운로드
      await imageRef.putFile(File(xFile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      //업데이트 (이후 currentUser로 바꾸기)
      await _userRef.doc(_userId).update({'imageUrl': downloadUrl});
    }
    getProfile();
    notifyListeners();
  }

  Future<void> logout() async {
    await _userRepository.signOut();
  }
}
