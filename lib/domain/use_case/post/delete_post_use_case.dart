import 'package:kovel_app/domain/repository/post_repository.dart';

class DeletePostUseCase {
  final PostRepository _postRepository;

  DeletePostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;

  Future<void> execute({required String postId}) async {
    await _postRepository.deletePost(postId: postId);
  }
}