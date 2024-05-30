import 'package:kovel_app/domain/model/post.dart';

abstract interface class PostRepository {
  Future<void> createPost({required Post post});
  Future<List<Post>> getPostList();
  Future<void> updatePost({required String postId, required Post post});
  Future<void> deletePost({required String postId});
}