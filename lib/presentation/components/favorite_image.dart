import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';

class FavoriteImage extends StatefulWidget {
  final String imagePath;
  final String area;
  final String title;

  const FavoriteImage({super.key, required this.imagePath, this.area = '', this.title = ''});

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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(widget.imagePath, width: 160.w, height: 160.w, fit: BoxFit.fill,),
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
                      : Icon(Icons.favorite_border, color: Colors.white)
              ),
            )
        ),
        Positioned(
          left: 16.w,
          bottom: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.area, style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade100)),
              Text(widget.title, style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont, color: UiConfig.black.shade100))
            ],
          ),
        )
      ],
    );
  }
}

