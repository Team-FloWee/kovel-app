import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/post/post_create_view_model.dart';
import 'package:provider/provider.dart';

class PostCreateScreen extends StatefulWidget {
  final Post? originalPost;
  const PostCreateScreen({super.key, this.originalPost});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  bool _isCreateMode = true;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.originalPost != null) {
      _isCreateMode = false;
      _titleController.text = widget.originalPost?.title ?? '';
      _contentController.text = widget.originalPost?.content ?? '';
    }
  }
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostCreateViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: CommonAppBar(
          title: _isCreateMode ? '게시글 작성' : '게시글 수정',
          action: IconButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() == false) return;
              if (_isCreateMode) {
                await viewModel.createPost(
                    postTypeId: '1',
                    userId: userProvider.user.userId,
                    title: _titleController.text,
                    content: _contentController.text
                );
              } else {
                await viewModel.updatePost(
                  postId: widget.originalPost!.postId,
                  postTypeId: widget.originalPost!.postTypeId,
                  userId: widget.originalPost!.userId,
                  title: _titleController.text,
                  content: _contentController.text,
                  createAt: widget.originalPost!.createAt
                );
              }
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: _isCreateMode
                    ? Text('게시글이 생성되었습니다.')
                    : Text('게시글이 수정되었습니다.'),
              ));
            },
            icon: Icon(Icons.edit, color: UiConfig.black.shade900)
          )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: UiConfig.primaryColor)
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: UiConfig.primaryColor)
                    ),
                    hintText: '제목',
                    hintStyle: UiConfig.h2Style.copyWith(
                        fontWeight: UiConfig.semiBoldFont,
                        color: UiConfig.black.shade700
                    ),
                  ),
                  style: UiConfig.h2Style.copyWith(fontWeight: UiConfig.semiBoldFont),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) return '제목을 입력해주세요.';
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 400.h
                  ),
                  child: TextFormField(
                    controller: _contentController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: UiConfig.primaryColor)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: UiConfig.primaryColor)
                      ),
                      hintText: '내용',
                      hintStyle: UiConfig.bodyStyle.copyWith(
                          color: UiConfig.black.shade700
                      )
                    ),
                    maxLines: null,
                    style: UiConfig.bodyStyle,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) return '내용을 입력해주세요.';
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
