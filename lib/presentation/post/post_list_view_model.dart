import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/get_user_use_case.dart';
import 'package:kovel_app/domain/use_case/post/get_post_list_use_case.dart';

class PostListViewModel with ChangeNotifier {
  final GetPostListUseCase _getPostListUseCase;
  final GetUserUseCase _getUserUseCase;

  PostListViewModel({
    required GetPostListUseCase getPostListUseCase,
    required GetUserUseCase getUserUseCase,
  }) : _getPostListUseCase = getPostListUseCase,
        _getUserUseCase = getUserUseCase;

  List<Post> _postList = [];
  List<Post> get postList => List.unmodifiable(_postList);
  List<User> _writerList = [];
  List<User> get writerList => List.unmodifiable(_writerList);

  void fetchPostList() async {
    _postList = await _getPostListUseCase.execute();
    for (Post post in _postList) {
      _writerList.add(await _getUserUseCase.execute(userId: post.userId));
    }
    notifyListeners();
  }
}