import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';

class ArchivedItem extends StatefulWidget {
  final String imagePath;
  final double imageSize;
  final String badgeTitle;
  final String title;

  const ArchivedItem(
      {super.key,
        required this.imagePath,
        required this.imageSize,
        this.badgeTitle = '',
        this.title = ''});

  @override
  State<ArchivedItem> createState() => _ArchivedItemState();
}

class _ArchivedItemState extends State<ArchivedItem> {
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.imagePath,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: UiConfig.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 3, left: 10, right: 10),
                    child: Text(
                      widget.badgeTitle,
                      style: UiConfig.smallStyle.copyWith(
                          fontWeight: UiConfig.semiBoldFont,
                          color: UiConfig.black.shade100),
                    ),
                  ),
                ),
              ),
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
