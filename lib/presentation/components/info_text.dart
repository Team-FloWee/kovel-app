import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class InfoText extends StatelessWidget {
  final String title;
  final String contents;
  const InfoText({super.key, required this.title, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              overflow: TextOverflow.ellipsis,
              title,
              style: UiConfig.bodyStyle
                  .copyWith(fontWeight: UiConfig.semiBoldFont),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              contents,
              style: UiConfig.bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}
