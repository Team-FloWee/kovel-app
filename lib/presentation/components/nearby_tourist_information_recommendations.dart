import 'package:flutter/material.dart';

class NearbyTouristInformation extends StatelessWidget {
  final String url;

  const NearbyTouristInformation({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
