import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';

import '../../core/utils/archived_util.dart';

class CourseRecommendation extends StatelessWidget {
  final TourDetail tourDetail;

  const CourseRecommendation({super.key, required this.tourDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteImage(
            archived: ArchivedUtil.getArchived(
              tourDetail: tourDetail,
            ),
            imageSize: 145,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xFF00D1FF),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5, top: 3, left: 10, right: 10),
                      child: Text(
                        tourDetail.categoryType.name,
                        style: UiConfig.smallStyle.copyWith(
                            color: UiConfig.black.shade100,
                            fontWeight: UiConfig.semiBoldFont),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  tourDetail.title,
                  style: UiConfig.h4Style
                      .copyWith(fontWeight: UiConfig.semiBoldFont),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  tourDetail.overview,
                  style: UiConfig.bodyStyle
                      .copyWith(fontWeight: UiConfig.regularFont),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
