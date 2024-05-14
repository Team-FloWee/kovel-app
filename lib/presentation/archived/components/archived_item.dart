import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/user_provider.dart';
import '../../../domain/model/archived.dart';

class ArchivedItem extends StatefulWidget {
  final Archived archived;
  final String imagePath;
  final String badgeTitle;
  final String title;

  const ArchivedItem({super.key,
    required this.imagePath,
    this.badgeTitle = '',
    this.title = '',
    required this.archived,
  });

  @override
  State<ArchivedItem> createState() => _ArchivedItemState();
}

class _ArchivedItemState extends State<ArchivedItem> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    isLiked = userProvider.isArchived(widget.archived.id);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Container(
            width: double.infinity, // 가로 크기 전체로 지정
            height: double.infinity, // 세로 크기 전체로 지정
            child: Image.network(
              widget.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/blank_image.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),

          ),
          Positioned.fill(
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.2), // 검은색(0, 0, 0)에 투명도 50% 적용
            ),
          ),
          Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: () {
                  userProvider.updateArchivedList(widget.archived);
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: isLiked
                        ? Icon(Icons.favorite, color: UiConfig.primaryColor)
                        : Icon(Icons.favorite_border, color: Colors.white)),
              )),
          Positioned(
            left: 16.w,
            bottom: 16.w,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: UiConfig.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, top: 3, left: 10, right: 10),
                        child: Text(
                          widget.badgeTitle,
                          style: UiConfig.smallStyle.copyWith(
                              fontWeight: UiConfig.semiBoldFont,
                              color: UiConfig.black.shade100),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    widget.title,
                    style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100,),),
                ],
            ),
          )
        ],
      ),
    );
  }
}
