import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class IconTextRow extends StatelessWidget {
  final IconData icon;
  final String text;


  const IconTextRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: UiConfig.black.shade800),
        SizedBox(width: 8,),
        Text( text ,style: UiConfig.bodyStyle .copyWith(fontWeight: UiConfig.semiBoldFont)),
      ],
    );
  }
}
