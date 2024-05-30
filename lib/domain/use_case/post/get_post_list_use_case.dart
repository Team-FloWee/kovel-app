import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/repository/post_repository.dart';

class GetPostListUseCase {
  final PostRepository _postRepository;

  GetPostListUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;

  Future<List<Post>> execute() async {
    return await _postRepository.getPostList();
  }
}