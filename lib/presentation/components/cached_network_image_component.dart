import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kovel_app/config/ui_config.dart';

class CachedNetworkImageComponent extends StatelessWidget {
  final String imagePath;
  final double imageSize;

  const CachedNetworkImageComponent({
    super.key,
    required this.imagePath,
    this.imageSize = 0
  });

  @override
  Widget build(BuildContext context) {
    if (imageSize == 0) {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imagePath,
        progressIndicatorBuilder: (context, url, progress) {
          return const Center(child: SpinKitFadingCircle(
            color: UiConfig.primaryColor,
          ));
        },
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/blank_image.png'),
      );
    } else {
      return CachedNetworkImage(
        width: imageSize,
        height: imageSize,
        fit: BoxFit.cover,
        imageUrl: imagePath,
        progressIndicatorBuilder: (context, url, progress) {
          return const Center(child: SpinKitFadingCircle(
            color: UiConfig.primaryColor,
          ));
        },
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/blank_image.png'),
      );
    }
  }
}
