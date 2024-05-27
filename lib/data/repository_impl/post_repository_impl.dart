import 'package:kovel_app/data/data_source/post_data_source.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl({required PostDataSource postDataSource})
      : _postDataSource = postDataSource;

  @override
  Future<void> createPost({required Post post}) async {
    await _postDataSource.createPost(post: post);
  }

  @override
  Future<List<Post>> getPostList() async {
    return await _postDataSource.getPostList();
  }

  @override
  Future<void> updatePost({required String postId, required Post post}) async {
    await _postDataSource.updatePost(postId: postId, post: post);
  }

  @override
  Future<void> deletePost({required String postId}) async {
    await _postDataSource.deletePost(postId: postId);
  }
}