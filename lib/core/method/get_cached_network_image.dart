import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget getCachedNetworkImage({required String imagePath}) {
  return AspectRatio(
    aspectRatio: 1 / 1,
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imagePath,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          Image.asset('assets/images/blank_image.png'),
    ),
  );
}
