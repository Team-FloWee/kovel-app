import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/get_user_use_case.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';
import 'package:kovel_app/presentation/post/post_list_view_model.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final User user;
  const PostWidget({super.key, required this.post, required this.user});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostListViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Container(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: UiConfig.black.shade500, height: 1),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.user.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.user.name, style: UiConfig.bodyStyle),
                      Text(
                          widget.post.createAt,
                          style: UiConfig.smallStyle.copyWith(
                              color: UiConfig.black.shade700
                          )
                      )
                    ],
                  ),
                  SizedBox(width: 16),
                ],
              ),
              userProvider.user.userId == widget.user.userId ?
              PopupMenuButton(
                  color: UiConfig.black.shade100,
                  surfaceTintColor: UiConfig.black.shade100,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('수정하기', style: UiConfig.bodyStyle),
                      onTap: () async {
                        await context.pushNamed('postList/create',
                          extra: widget.post
                        );
                        await viewModel.fetchPostList();
                      },
                    ),
                    PopupMenuItem(
                      child: Text('삭제하기', style: UiConfig.bodyStyle),
                      onTap: () async {
                        await viewModel.deletePost(postId: widget.post.postId);
                        await viewModel.fetchPostList();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('게시글이 삭제되었습니다.'),
                        ));
                      },
                    ),
                  ]
              )
              : PopupMenuButton(
                color: UiConfig.black.shade100,
                surfaceTintColor: UiConfig.black.shade100,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('신고하기', style: UiConfig.bodyStyle),
                  ),
                  PopupMenuItem(
                    child: Text('차단하기', style: UiConfig.bodyStyle),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.title, style: UiConfig.bodyStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont)
                ),
                SizedBox(height: 4),
                Text(widget.post.content, style: UiConfig.bodyStyle)
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      )
    );
  }
}
