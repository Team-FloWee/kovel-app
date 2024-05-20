import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/provider/user_provider.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    isLiked = userProvider.isArchived(widget.archived.id);
    return Stack(
      children: [
        CachedNetworkImageComponent(
          imagePath: widget.archived.imagePath,
          imageSize: widget.imageSize,
        ),
        Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                userProvider.updateArchivedList(widget.archived);
              },
              child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: isLiked
                      ? const Icon(Icons.favorite, color: UiConfig.primaryColor)
                      : const Icon(Icons.favorite_border, color: Colors.white)),
            )),
        widget.area != '' && widget.title != ''
            ? Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: UiConfig.black.shade900.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  height: 50,
                ),
              )
            : const SizedBox(),
        Positioned(
          left: 8,
          bottom: 8,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.area,
                    style: UiConfig.smallStyle
                        .copyWith(color: UiConfig.black.shade100)),
                Text(widget.title,
                    style: UiConfig.bodyStyle.copyWith(
                        fontWeight: UiConfig.semiBoldFont,
                        color: UiConfig.black.shade100))
              ],
            ),
          ),
        )
      ],
    );
  }
}
