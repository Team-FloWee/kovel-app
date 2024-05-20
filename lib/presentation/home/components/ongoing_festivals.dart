import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/category/area_type.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/presentation/components/cached_network_image_component.dart';
import 'package:provider/provider.dart';

class OngoingFestivals extends StatefulWidget {
  final Tour tourData;
  final Archived archived;
  final Function onSelect;

  const OngoingFestivals({
    super.key,
    required this.onSelect,
    required this.tourData,
    required this.archived,
  });

  @override
  State<OngoingFestivals> createState() => _OngoingFestivalsState();
}

class _OngoingFestivalsState extends State<OngoingFestivals> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    isLiked = userProvider.isArchived(widget.archived.id);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Stack(
        children: [
          Positioned(
            child: GestureDetector(
                onTap: () {
                  widget.onSelect.call(widget.tourData);
                },
                child: CachedNetworkImageComponent(
                  imagePath: widget.tourData.imagePath,
                  imageSize: 350,
                )),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.007,
              right: MediaQuery.of(context).size.width * 0.02,
              child: InkWell(
                onTap: () {
                  userProvider.updateArchivedList(widget.archived);
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: isLiked
                    ? const Icon(Icons.favorite, color: UiConfig.primaryColor)
                    : const Icon(Icons.favorite_border, color: Colors.white),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: UiConfig.black.shade900.withOpacity(0.5),
              ),
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.clip,
                  AreaType(areaCode: widget.tourData.areaCode).name,
                  style: UiConfig.smallStyle.copyWith(
                    color: UiConfig.black.shade100,
                  ),
                ),
                Text(
                  overflow: TextOverflow.clip,
                  widget.tourData.title,
                  style: UiConfig.bodyStyle.copyWith(
                    color: UiConfig.black.shade100,
                    fontWeight: UiConfig.semiBoldFont,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
