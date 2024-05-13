import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/presentation/user/user_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteImage extends StatefulWidget {
  final Archived archived;
  final double imageSize;
  final String area;
  final String title;

  const FavoriteImage({
    super.key,
    required this.archived,
    required this.imageSize,
    this.area = '',
    this.title = '',
  });

  @override
  State<FavoriteImage> createState() => _FavoriteImageState();
}

class _FavoriteImageState extends State<FavoriteImage> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    // Future.microtask(() =>
    //     isLiked = context.read<UserViewModel>().isArchived(widget.archived.id));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    isLiked = userViewModel.isArchived(widget.archived.id);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.archived.imagePath,
            width: widget.imageSize,
            height: widget.imageSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/blank_image.png',
                  width: widget.imageSize,
                  height: widget.imageSize,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                userViewModel.updateArchivedList(widget.archived);
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: isLiked
                      ? Icon(Icons.favorite, color: UiConfig.primaryColor)
                      : Icon(Icons.favorite_border, color: Colors.white)),
            )),
        Positioned(
          left: 16.w,
          bottom: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.area,
                  style: UiConfig.smallStyle
                      .copyWith(color: UiConfig.black.shade100)),
              Text(widget.title,
                  style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100))
            ],
          ),
        )
      ],
    );
  }
}
