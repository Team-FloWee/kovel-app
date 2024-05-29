import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/post/components/post_widget.dart';
import 'package:kovel_app/presentation/post/post_list_view_model.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PostListViewModel>().fetchPostList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostListViewModel>();
    return Scaffold(
      appBar: CommonAppBar(
        title: '',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: ListView.builder(
              itemCount: viewModel.postList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PostWidget(
                  post: viewModel.postList[index],
                  user: viewModel.writerList[index],
                );
              }
            ),
          )
      ),
      bottomNavigationBar: BottomNaviBar(selectedIndex: 1),
    );
  }
}
