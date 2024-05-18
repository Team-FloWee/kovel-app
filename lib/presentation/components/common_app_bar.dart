import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:provider/provider.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final ScrollController? controller;
  const CommonAppBar({
    super.key,
    required this.title,
    this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    bool isCanPop = Navigator.of(context).canPop();
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: UiConfig.black.shade100,
      leading: isCanPop ? InkWell(onTap: () {
          context.pop();
          userProvider.getUser();
      },
      child: const Icon(Icons.arrow_back_ios)) : const SizedBox(),
      centerTitle: true,
      title: GestureDetector(
        onDoubleTap: () {
          if (controller != null && controller!.hasClients) {
            controller!.animateTo(
              0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        },
        child: Text(
          title,
          style: UiConfig.h3Style.copyWith(
            fontWeight: UiConfig.semiBoldFont,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
