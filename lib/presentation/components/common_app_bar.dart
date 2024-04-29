import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: UiConfig.black.shade100,
      leading: Icon(Icons.arrow_back_ios),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(right: 33.4),
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
