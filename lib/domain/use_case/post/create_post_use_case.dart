import 'package:intl/intl.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/repository/post_repository.dart';

class CreatePostUseCase {
  final PostRepository _postRepository;

  CreatePostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;

  Future<void> execute({
    required String postTypeId,
    required String userId,
    required String title,
    required String content,
  }) async {
    await _postRepository.createPost(
        post: Post(
            postId: '',
            postTypeId: postTypeId,
            userId: userId,
            title: title,
            content: content,
            createAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
            updateAt: ''
        )
    );
  }
}