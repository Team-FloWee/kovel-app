import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

import '../../components/cached_network_image_component.dart';

class ScheduleImageButton extends StatelessWidget {
  final String date;
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const ScheduleImageButton({
    super.key,
    required this.date,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(13.0, 0.0, 13.0, 26.0),
        width: double.infinity,
        height: 140,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: CachedNetworkImageComponent(
                imagePath: imagePath,
                imageSize: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
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
      ),
    );
  }
}
