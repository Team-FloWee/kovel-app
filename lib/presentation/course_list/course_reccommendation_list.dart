import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';

class CourseRecommendation extends StatelessWidget {
  final String url;
  final String course;
  final String title;
  final String content;

  const CourseRecommendation(
      {super.key,
      required this.url,
      required this.course,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteImage(
            imagePath: url,
            title: 'data',
            area: '145',
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      child: Text(
                        course,

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
                  title,
                  style: UiConfig.h4Style
                      .copyWith(fontWeight: UiConfig.semiBoldFont),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  content,
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
