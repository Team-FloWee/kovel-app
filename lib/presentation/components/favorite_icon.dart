import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatefulWidget {
  final Archived archived;
  const FavoriteIcon({
    super.key,
    required this.archived,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    isLiked = userProvider.isArchived(widget.archived.id);
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        userProvider.updateArchivedList(widget.archived);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 24.w,
          height: 24.w,
          child: isLiked
              ? const Icon(Icons.favorite, color: UiConfig.primaryColor)
              : const Icon(Icons.favorite_border, color: UiConfig.primaryColor),
        ),
      ),
    );
  }
}
