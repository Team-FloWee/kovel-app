import 'package:kovel_app/domain/model/post.dart';

abstract interface class PostDataSource {
  Future<void> createPost({
    required String userId,
    required String title,
    required String content,
  });
  Future<List<Post>> getPostList();
  Future<void> updatePost({
    required String postId,
    required String title,
    required String content
  });
  Future<void> deletePost({required String postId});
}