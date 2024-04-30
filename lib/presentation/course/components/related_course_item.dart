import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';

class RelatedCourseItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String overview;
  const RelatedCourseItem({super.key, required this.imagePath, required this.title, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imagePath, width: 100, height: 100, fit: BoxFit.fill,),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title, style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont)),
                  SizedBox(height: 8),
                  Text(overview, style: UiConfig.smallStyle, maxLines: 4, overflow: TextOverflow.ellipsis)
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
