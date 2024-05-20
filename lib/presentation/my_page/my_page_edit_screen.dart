import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/presentation/my_page/my_page_view_model.dart';
import 'package:provider/provider.dart';

class MyPageEditScreen extends StatefulWidget {
  const MyPageEditScreen({super.key});

  @override
  State<MyPageEditScreen> createState() => _MyPageEditScreenState();
}

class _MyPageEditScreenState extends State<MyPageEditScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<UserProvider>().user.name;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await viewModel.updatePhoto(userId: userProvider.user.userId);
                  userProvider.fetchUser();
                },
                child: SizedBox(
                  width: 72.0,
                  height: 72.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: userProvider.user.imageUrl,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset(
                            'assets/images/blank_profile_image.png'),
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _controller,
              ),
              TextButton(
                onPressed: () async {
                  await viewModel.updateName(
                    userId: userProvider.user.userId,
                    name: _controller.text,
                  );
                  userProvider.fetchUser();
                  if (context.mounted) context.pop();
                },
                child: Text('수정완료'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
