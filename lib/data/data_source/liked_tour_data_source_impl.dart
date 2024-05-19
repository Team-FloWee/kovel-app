import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kovel_app/data/data_source/liked_tour_data_source.dart';

class LikedTourDataSourceImpl implements LikedTourDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _tourRef = FirebaseFirestore.instance.collection('likedTour');

  @override
  Future<void> createLikedTour({required int id}) async {
    Map<String, int> tour = {
      'id': id,
      'likeCount': (await getTour(id: id))?['likeCount'] ?? 0
    };
    await _tourRef.doc('$id').set(tour);
  }

  @override
  Future<Map<String, dynamic>?> getTour({required int id}) async {
    final data = await _firestore.collection('likedTour').doc('$id').get().then((value) => value.data());

    return data;
  }

  @override
  Future<void> likeTour({required int id}) async {
    await createLikedTour(id: id);
    Map<String, dynamic>? tour = await getTour(id: id);
    tour!['likeCount'] = tour['likeCount'] + 1;

    await _tourRef.doc('$id').set(tour);
  }

  @override
  Future<void> unLikeTour({required int id}) async {
    Map<String, dynamic>? tour = await getTour(id: id);
    tour!['likeCount'] = tour['likeCount'] - 1;

    await _tourRef.doc('$id').set(tour);
  }

  @override
  Future<List<int>> getPopularTourIdList({required int count}) async {
    final data = await _tourRef.orderBy('likeCount', descending: true).limit(count).get();
    final List<int> result = [];
    for (QueryDocumentSnapshot doc in data.docs) {
      result.add((doc.data() as Map)['id']);
    }
    return result;
  }
}