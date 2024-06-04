import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

import '../../components/cached_network_image_component.dart';

class ScheduleImageButton extends StatelessWidget {
  final String date;
  final String title;
  final String imagePath;
  final double screenWidth;
  final VoidCallback onTap;

  const ScheduleImageButton({
    super.key,
    required this.date,
    required this.title,
    required this.imagePath,
    required this.screenWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double textPosition = 31.0;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(13.0),
            width: screenWidth,
            height: 140,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: CachedNetworkImageComponent(imagePath: imagePath)),
          ),
          Positioned(
            bottom: textPosition,
            left: textPosition,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: UiConfig.h3Style.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: UiConfig.bodyStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
