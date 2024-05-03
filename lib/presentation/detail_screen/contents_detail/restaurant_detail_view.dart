import 'package:flutter/material.dart';

import '../../../domain/model/detail/restaurant/restaurant_detail.dart';
import '../../../domain/model/detail/tour_detail.dart';
import '../../components/icon_text_row.dart';

// stateless로 만들기
Widget restaurantDetailView(
  BuildContext context,
  TourDetail tourDetailData,
  RestaurantDetail restaurantDetailData,
) {
  // 공통 정보에 번호 정보가 빈값일 때, 소개 정보의 번호를 담기 위한 변수
  String restaurantTel = tourDetailData.tel;
  if (restaurantTel == '') {
    restaurantTel = restaurantDetailData.infoCenter;
  }

  return Column(
    children: [
      // 소개 정보 리스트
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            IconTextRow(
              icon: Icons.restaurant,
              text: restaurantDetailData.treatMenu,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.local_parking,
              text: restaurantDetailData.parking,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.access_time_filled,
              text: restaurantDetailData.openTime,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.door_front_door,
              text: restaurantDetailData.restDay,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ],
  );
}
