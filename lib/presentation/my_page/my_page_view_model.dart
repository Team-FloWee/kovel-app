import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kovel_app/domain/model/user.dart';

class MyPageViewModel with ChangeNotifier {
  late User _user;
  User get user => _user;

  final userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  final _picker = ImagePicker();

  //setProfile은 추후 로그인 쪽으로 이동할 예정
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
    _user =
        await userRef.doc('0FPrtfSJJDjR5xnbXdoK').get().then((s) => s.data()!);
    notifyListeners();

    // _user = auth.FirebaseAuth.instance.currentUser as User;
    // notifyListeners();
  }

  void updateName(String name) async {
    await userRef.doc('0FPrtfSJJDjR5xnbXdoK').update({'name': name});
    notifyListeners();
  }

  void updatePhoto() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      //이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef =
          storageRef.child('user/0FPrtfSJJDjR5xnbXdoK/profile/profile.png');

      //이미지 다운로드
      await imageRef.putFile(File(xFile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      //업데이트 (이후 currentUser로 바꾸기)
      await userRef
          .doc('0FPrtfSJJDjR5xnbXdoK')
          .update({'imageUrl': downloadUrl});
    }
    //업데이트된거 다시 불러오기
    getProfile();
    notifyListeners();
  }
}
