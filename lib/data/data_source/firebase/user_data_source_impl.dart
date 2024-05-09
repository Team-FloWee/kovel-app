import 'package:cloud_firestore/cloud_firestore.dart';
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
    await _userRef.doc(user.userId).update({
      'email': user.email,
      'imageUrl': user.imageUrl,
      'name': user.name
    });
  }

  @override
  Future<User> getUser({required String id}) async {
    final user = await _userRef.doc(id).get().then((s) => s.data()!);
    return user;
  }
}
