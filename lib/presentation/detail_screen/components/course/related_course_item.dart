import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';

class RelatedCourseItem extends StatelessWidget {
  final UnifiedInfo info;
  const RelatedCourseItem({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: info.imagePath == ''? Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: UiConfig.black.shade500,
                ),
              ) : Image.network(
                info.imagePath, width: 100, height: 100, fit: BoxFit.fill,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  }
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: UiConfig.black.shade500,
                    ),
                  );
                },
                errorBuilder: (context, error, stacktrace) {
                  return Image.asset('assets/images/blank_image.png', width: 100, height: 100);
                },
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(info.name, style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont)),
                  SizedBox(height: 8),
                  Text(info.overview, style: UiConfig.smallStyle, maxLines: 4, overflow: TextOverflow.ellipsis)
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
