import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/bottom_navi_bar.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '',
      ),
      body: SafeArea(
          child: Container(
            child: Text('hi'),
          )
      ),
      bottomNavigationBar: BottomNaviBar(selectedIndex: 1),
    );
  }
}
