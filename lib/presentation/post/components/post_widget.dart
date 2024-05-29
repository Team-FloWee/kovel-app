import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/post.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/domain/use_case/auth/get_user_use_case.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final User user;
  const PostWidget({super.key, required this.post, required this.user});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: UiConfig.black.shade500, height: 1),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  widget.user.imageUrl,
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.name, style: UiConfig.bodyStyle),
                  Text(
                      widget.post.createAt,
                      style: UiConfig.smallStyle.copyWith(
                          color: UiConfig.black.shade700
                      )
                  )
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.title, style: UiConfig.bodyStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont)
                ),
                SizedBox(height: 4),
                Text(widget.post.content, style: UiConfig.bodyStyle)
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      )
    );
  }
}
