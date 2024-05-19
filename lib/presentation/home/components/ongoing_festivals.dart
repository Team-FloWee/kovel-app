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
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0, bottom: 8.0),
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
              )
            ),
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
                child: isLiked ? const Icon(Icons.favorite, color: UiConfig.primaryColor) : const Icon(Icons.favorite_border, color: Colors.white),
              )),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0,
            left: MediaQuery.of(context).size.width * 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                color: UiConfig.black.shade900.withOpacity(0.5),
              ),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.035,
              left: MediaQuery.of(context).size.width * 0.04,
              child: Text(
                AreaType(areaCode: widget.tourData.areaCode).name,
                style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade100),
              )),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.006,
            left: MediaQuery.of(context).size.width * 0.04,
            child: Text(
              widget.tourData.title,
              style: UiConfig.bodyStyle.copyWith(color: UiConfig.black.shade100, fontWeight: UiConfig.semiBoldFont),
            ),
          ),
        ],
      ),
    );
  }
}
