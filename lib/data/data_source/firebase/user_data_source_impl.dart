import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:kovel_app/data/data_source/firebase/user_data_source.dart';
import 'package:kovel_app/domain/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  @override
  Future<void> createUser({required User user}) async {
    await _userRef.doc(user.userId).set(user);
  }

  @override
  Future<void> updateUser({required User user}) async {
    await _userRef.doc(user.userId).update(
        {'email': user.email, 'imageUrl': user.imageUrl, 'name': user.name});
  }

  @override
  Future<User> getUser({required String id}) async {
    final user = await _userRef.doc(id).get().then((s) => s.data()!);
    return user;
  }

  @override
  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  @override
  Future<bool> existUser({required String id}) async {
    final result = await _userRef.doc(id).get().then((s) => s.data()!)
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return result;
  }
}
