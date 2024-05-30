// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';

class ScheduleList extends StatelessWidget {
  final String index;
  final Archived archived;
  final bool isSelected;

  ScheduleList({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.archived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.h,
          width: double.infinity,
          color: isSelected
              ? UiConfig.primaryColorSurface
              : UiConfig.black.shade500,
          constraints: BoxConstraints(maxHeight: 80),
        ),
        Positioned(
          top: 8,
          right: 8,
          bottom: 8,
          left: 78,
          child: Container(
            decoration: BoxDecoration(
              color: UiConfig.black.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          left: 88,
          child: Row(
            children: [
              Text(
                archived.title,
                style: UiConfig.bodyStyle.copyWith(
                  fontWeight: UiConfig.semiBoldFont,
                ),
              ),
              SizedBox(width: 8.w),
              Text('|'),
              SizedBox(width: 6.w),
              Text(ContentType(contentTypeId: archived.contentType).name,
                  style: UiConfig.bodyStyle),
            ],
          ),
        ),
        Positioned(
          left: 28,
          top: 30,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: UiConfig.primaryColor),
            child: Center(
              child: Text(
                index,
                style: UiConfig.smallStyle.copyWith(
                  color: UiConfig.black.shade100,
                  fontWeight: UiConfig.semiBoldFont,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 15.w,
          child: Image.asset('assets/images/directions.png'),
        ),
        Positioned(
          left: 38,
          top: 0,
          child: Container(
            height: 30,
            width: 2,
            color: UiConfig.primaryColor,
          ),
        ),
        Positioned(
          left: 38,
          top: 50,
          child: Container(
            height: 30,
            width: 2,
            color: UiConfig.primaryColor,
          ),
        ),
      ],
      alignment: Alignment.center,
    );
  }
}
