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
        children: [
          SizedBox(
            width: 80,
            child: Text(
              overflow: TextOverflow.ellipsis,
              title,
              style:
                  UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            contents,
            style: UiConfig.h4Style,
          ),
        ],
      ),
    );
  }
}
