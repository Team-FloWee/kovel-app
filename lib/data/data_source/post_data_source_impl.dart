import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kovel_app/data/data_source/post_data_source.dart';
import 'package:kovel_app/domain/model/post.dart';

class PostDataSourceImpl implements PostDataSource {
  final _postRef = FirebaseFirestore.instance
      .collection('post')
      .withConverter<Post>(
      fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
      toFirestore: (snapshot, _) => snapshot.toJson());

  @override
  Future<void> createPost({required Post post}) async {
    await _postRef.add(post);
  }

  @override
  Future<List<Post>> getPostList() async {
    return await _postRef.get()
        .then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updatePost({required String postId, required Post post}) async {
    await _postRef.doc(postId).set(post);
  }

  @override
  Future<void> deletePost({required String postId}) async {
    await _postRef.doc(postId).delete();
  }
}