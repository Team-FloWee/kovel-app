import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class CourseDetailText extends StatefulWidget {
  final String badgeTitle;
  final String title;
  final String overview;

  const CourseDetailText({
    super.key,
    required this.badgeTitle,
    required this.title,
    required this.overview
  });

  @override
  State<CourseDetailText> createState() => _CourseDetailTextState();
}

class _CourseDetailTextState extends State<CourseDetailText> {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: UiConfig.primaryColor,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    widget.badgeTitle,
                    style: UiConfig.smallStyle.copyWith(
                        fontWeight: UiConfig.semiBoldFont,
                        color: UiConfig.black.shade100),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: isLiked
                  ? Icon(Icons.favorite, size: 24, color: UiConfig.primaryColor)
                  : Icon(Icons.favorite, size: 24, color: UiConfig.black.shade600)
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(widget.title,
            style: UiConfig.h4Style
                .copyWith(fontWeight: UiConfig.semiBoldFont),),
        SizedBox(
          height: 8,
        ),
        Text(widget.overview, style: UiConfig.bodyStyle)
      ],
    );
  }
}
