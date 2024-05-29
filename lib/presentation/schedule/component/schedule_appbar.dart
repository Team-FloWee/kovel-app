import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';

class ScheduleAppbar extends StatelessWidget {
  final String days;
  final String dates;
  const ScheduleAppbar({
    super.key,
    required this.days,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            days,
            style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            dates,
            style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade700),
          ),
        ],
      ),
      actions: [
        Text(
          '편집',
          style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade700),
        ),
        SizedBox(
          width: 15.w,
        ),
      ],
    );
  }
}
