import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isCanPop = Navigator.of(context).canPop();
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: UiConfig.black.shade100,
      leading: isCanPop ? InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios)
      ) : SizedBox(),
      centerTitle: true,
      title: Text(
        title,
        style: UiConfig.h3Style.copyWith(
          fontWeight: UiConfig.semiBoldFont,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
