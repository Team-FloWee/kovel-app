import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/icon_text_row.dart';

import '../../config/ui_config.dart';

class CommonText extends StatelessWidget {
  final String badgeTitle;
  final String title;
  final String tel;
  final String address;

  const CommonText({
    super.key,
    required this.badgeTitle,
    required this.title,
    required this.tel,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: UiConfig.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, top: 3, left: 10, right: 10),
                child: Text(
                  badgeTitle,
                  style: UiConfig.smallStyle.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          IconTextRow(icon: Icons.phone, text: tel, maxline: 1),
          IconTextRow(
            icon: Icons.location_on_rounded,
            text: address,
            maxline: 1,
          ),
        ],
      ),
    );
  }
}
