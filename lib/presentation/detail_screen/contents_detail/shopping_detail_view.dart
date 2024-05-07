import 'package:flutter/material.dart';
import 'package:kovel_app/domain/model/detail/shopping/shopping_detail.dart';

import '../../../domain/model/detail/tour_detail.dart';
import '../../components/icon_text_row.dart';

Widget shoppingDetailView(
  BuildContext context,
  TourDetail tourDetailData,
  ShoppingDetail shoppingDetailData,
) {
  // 공통 정보에 번호 정보가 빈값일 때, 소개 정보의 번호를 담기 위한 변수
  String shoppingTel = tourDetailData.tel;
  if (shoppingTel == '') {
    shoppingTel = shoppingDetailData.infoCenter;
  }

  return Column(
    children: [
      // 소개 정보 리스트
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            IconTextRow(
              icon: Icons.local_offer,
              text: shoppingDetailData.saleItem,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.monetization_on,
              text: shoppingDetailData.saleItemCost,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.door_front_door,
              text: shoppingDetailData.restDay,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.maps_home_work,
              text: shoppingDetailData.scale,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.credit_card,
              text: shoppingDetailData.creditCard,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.access_time_filled,
              text: shoppingDetailData.openTime,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ],
  );
}
