import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/post/components/post_widget.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PostWidget();
              }
            ),
          )
      ),
      bottomNavigationBar: BottomNaviBar(selectedIndex: 1),
    );
  }
}
