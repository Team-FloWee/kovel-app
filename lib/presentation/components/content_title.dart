import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/ui_config.dart';

class ContentTitle extends StatelessWidget {
  final String title;
  final bool withMore;
  final Function()? onTapMore;

  const ContentTitle({
    super.key,
    required this.title,
    this.withMore = false,
    this.onTapMore,
  });

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
                  onTapMore!();
                  // TODO: router 기능 추가 >> 이동할 screen을 변수로 받기
                },
                child: Text(
                  '더보기'.tr(),
                  style: UiConfig.bodyStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                    color: UiConfig.black.shade700,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
