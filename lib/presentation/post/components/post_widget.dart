import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: Column(
        children: [
          Divider(color: UiConfig.black.shade500, height: 1),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/blank_image.png',
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('유저 이름', style: UiConfig.bodyStyle),
                  Text('2024-05-29 14:50:21',
                  style: UiConfig.smallStyle.copyWith(
                      color: UiConfig.black.shade700)
                  )
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text('이것은 내용입니다. 길어질 수도 있을 것 같으니 나중에 더보기같은 기능을 추가해야 할 것 같습니다.'),
          ),
          SizedBox(height: 16),
        ],
      )
    );
  }
}
