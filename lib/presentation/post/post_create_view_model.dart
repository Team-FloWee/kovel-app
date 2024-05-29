import 'package:flutter/material.dart';
import 'package:kovel_app/domain/use_case/post/create_post_use_case.dart';

class PostCreateViewModel with ChangeNotifier {
  final CreatePostUseCase _createPostUseCase;

  PostCreateViewModel({
    required CreatePostUseCase createPostUseCase
  }): _createPostUseCase = createPostUseCase;

  Future<void> createPost({
    required String postTypeId,
    required String userId,
    required String title,
    required String content
  }) async {
    await _createPostUseCase.execute(
        postTypeId: postTypeId,
        userId: userId,
        title: title,
        content: content
    );
  }
}