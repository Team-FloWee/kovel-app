import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/category/area_type.dart';
import 'package:kovel_app/domain/model/tour.dart';

class OngoingFestivals extends StatelessWidget {
  final Tour tourData;

  final Function onSelect;
  const OngoingFestivals({super.key, required this.onSelect, required this.tourData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0, bottom: 8.0),
      child: Stack(
        children: [
          Positioned(
            child: GestureDetector(
              onTap: () {
                onSelect.call(tourData);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(tourData.imagePath),
                  ),
                ),

                height: 350, // 내용의 높이
                width: 350,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.007,
            right: MediaQuery.of(context).size.width * 0.02,
            child: Icon(
              Icons.favorite_outline,
              color: UiConfig.black.shade100,
            ),
          ),
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
                AreaType(areaCode: tourData.areaCode).name,
                style: UiConfig.smallStyle.copyWith(color: UiConfig.black.shade100),
              )),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.006,
            left: MediaQuery.of(context).size.width * 0.04,
            child: Text(
              tourData.title,
              style: UiConfig.bodyStyle.copyWith(color: UiConfig.black.shade100, fontWeight: UiConfig.semiBoldFont),
            ),
          ),
        ],
      ),
    );
  }
}
