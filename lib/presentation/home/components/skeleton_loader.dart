import 'package:flutter/cupertino.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: UiConfig.black.shade200,
        highlightColor: UiConfig.black.shade100,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
