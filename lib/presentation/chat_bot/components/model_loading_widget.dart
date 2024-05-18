import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';

class ModelLoadingWidget extends StatelessWidget {
  const ModelLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: UiConfig.black.shade100,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: const CircularProgressIndicator()
            ),
          ),
        ),
      ],
    );
  }
}
