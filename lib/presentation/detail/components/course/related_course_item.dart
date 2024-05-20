import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';

class RelatedCourseItem extends StatelessWidget {
  final UnifiedInfo info;
  const RelatedCourseItem({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImageComponent(
              imagePath: info.imagePath,
              imageSize: 100,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(info.name, style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont)),
                  const SizedBox(height: 8),
                  Text(info.overview, style: UiConfig.smallStyle, maxLines: 4, overflow: TextOverflow.ellipsis)
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
