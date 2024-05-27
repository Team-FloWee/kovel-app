import 'package:intl/intl.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/repository/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository _postRepository;

  UpdatePostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;

  Future<void> execute({
    required String postId,
    required String postTypeId,
    required String userId,
    required String title,
    required String content,
    required String createAt,
  }) async {
    await _postRepository.updatePost(
        postId: postId,
        post: Post(
            postTypeId: postTypeId,
            userId: userId,
            title: title,
            content: content,
            createAt: createAt,
            updateAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()))
    );
  }
}