import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/di/di_setup.dart';
import 'package:kovel_app/domain/model/user.dart';

import '../../core/auth/user_provider.dart';

class MyPageViewModel with ChangeNotifier {
  late User _user;
  User get user => _user;
  String userId =
      UserProvider(likeTourUseCase: getIt(), unLikeTourUseCase: getIt())
          .getUserId();
  final userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());
  final _picker = ImagePicker();

  void getProfile() async {
    _user = await userRef.doc(userId).get().then((value) => value.data()!);
    notifyListeners();
  }

  void updateLanguage(String lang) async {
    LanguageUtil().getLanguage(lang);
    await userRef.doc(user.userId).update({'language': lang});
    getProfile();
    notifyListeners();
  }

  void updateName(String name) async {
    await userRef.doc(userId).update({'name': name});
    getProfile();
    notifyListeners();
  }

  void updatePhoto() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      //이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('user/${userId}/profile/profile.png');

      //이미지 다운로드
      await imageRef.putFile(File(xFile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      //업데이트 (이후 currentUser로 바꾸기)
      await userRef.doc(userId).update({'imageUrl': downloadUrl});
      getProfile();
    }
    //업데이트된거 다시 불러오기
    getProfile();
    notifyListeners();
  }

  void logout() async {
    await auth.FirebaseAuth.instance.signOut();
  }
}
