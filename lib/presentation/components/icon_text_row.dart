import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class IconTextRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final int maxline;

  const IconTextRow(
      {super.key, required this.icon, required this.text, this.maxline = 0});

  @override
  Widget build(BuildContext context) {
    return text != '' ? Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1.5),
            child: Icon(icon, size: 18, color: UiConfig.black.shade800),
          ),
          Expanded(
            child: maxline == 0
                ? Text(
              text,
              style: UiConfig.bodyStyle.copyWith(
                fontWeight: UiConfig.semiBoldFont,
              ),
            )
                : Text(
              text,
              style: UiConfig.bodyStyle.copyWith(
                fontWeight: UiConfig.semiBoldFont,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: maxline,
            ),
          ),
        ],
      ),
    ) : SizedBox();
  }
}