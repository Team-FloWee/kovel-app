import 'package:flutter/material.dart';

import '../../config/ui_config.dart';

class ContentTitle extends StatelessWidget {
  final String title;
  final bool withMore;

  const ContentTitle({super.key, required this.title, this.withMore = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: UiConfig.h3Style.copyWith(fontWeight: UiConfig.semiBoldFont),
        ),
        withMore
            ? InkWell(
                onTap: () {
                  // TODO: router 기능 추가 >> 이동할 screen을 변수로 받기
                },
                child: Text(
                  '더보기',
                  style: UiConfig.bodyStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                    color: UiConfig.black.shade700,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
