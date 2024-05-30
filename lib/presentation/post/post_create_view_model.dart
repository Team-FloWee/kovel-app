import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/use_case/post/create_post_use_case.dart';
import 'package:kovel_app/domain/use_case/post/update_post_use_case.dart';

class PostCreateViewModel with ChangeNotifier {
  final CreatePostUseCase _createPostUseCase;
  final UpdatePostUseCase _updatePostUseCase;

  PostCreateViewModel({
    required CreatePostUseCase createPostUseCase,
    required UpdatePostUseCase updatePostUseCase,
  }): _createPostUseCase = createPostUseCase,
        _updatePostUseCase = updatePostUseCase;

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

  Future<void> updatePost({
    required String postId,
    required String postTypeId,
    required String userId,
    required String title,
    required String content,
    required String createAt
  }) async {
    await _updatePostUseCase.execute(
        postId: postId,
        postTypeId: postTypeId,
        userId: userId,
        title: title,
        content: content,
        createAt: createAt
    );
  }
}