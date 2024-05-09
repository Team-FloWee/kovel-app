import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kovel_app/data/data_source/firebase/user_data_source.dart';
import 'package:kovel_app/domain/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser({required User user}) async {
    await _firestore.collection('user').doc(user.userId).set(user.toJson());
  }
}
