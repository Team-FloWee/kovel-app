import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/archived.dart';

class ArchivedItem extends StatefulWidget {
  final Archived archived;

  const ArchivedItem({
    super.key,
    required this.archived,
  });

  @override
  State<ArchivedItem> createState() => _ArchivedItemState();
}

class _ArchivedItemState extends State<ArchivedItem> {
  bool isLiked = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        isLiked = context.read<UserProvider>().isArchived(widget.archived.id));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return InkWell(
      onTap: () {
        context.pushNamed('detail', queryParameters: {
          'id': widget.archived.id.toString(),
          'contentTypeId': widget.archived.contentType.toString(),
          'title': widget.archived.title
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity, // 가로 크기 전체로 지정
              height: double.infinity, // 세로 크기 전체로 지정
              child: CachedNetworkImageComponent(
                imagePath: widget.archived.imagePath,
              )
            ),
            Positioned.fill(
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.2), // 검은색(0, 0, 0)에 투명도 50% 적용
              ),
            ),
            Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      userProvider.updateArchivedList(widget.archived);
                    },
                    child: SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: const Icon(Icons.favorite,
                            color: UiConfig.primaryColor)))),
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
                          ContentType(
                                  contentTypeId: widget.archived.contentType)
                              .name,
                          style: UiConfig.smallStyle.copyWith(
                              fontWeight: UiConfig.semiBoldFont,
                              color: UiConfig.black.shade100),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.archived.title,
                    style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
