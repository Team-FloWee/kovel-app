import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> likeTour(int id) async {
    await createTourField(id);
    Map<String, dynamic>? tour = await getTour(id);
    tour!['likeCount'] = tour['likeCount'] + 1;

    await _firestore.collection('tours').doc('$id').set(tour);
  }

  Future<void> createTourField(int id) async {
    Map<String, int> map = {
      'id': id,
      'likeCount': (await getTour(id))?['likeCount'] ?? 0
    };
    await _firestore.collection('tours').doc('$id').set(map);
  }

  Future<Map<String, dynamic>?> getTour(int id) async {
    final data = await _firestore.collection('tours').doc('$id').get().then((value) => value.data());

    return data;
  }
}