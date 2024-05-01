import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/domain/model/detail/lodgment/lodgment_detail.dart';

import '../../../domain/model/detail/tour_detail.dart';
import '../../components/icon_text_row.dart';

Widget lodgmentDetailView(
  BuildContext context,
  TourDetail tourDetailData,
  LodgmentDetail lodgmentDetailData,
) {
  // 공통 정보에 번호 정보가 빈값일 때, 소개 정보의 번호를 담기 위한 변수
  String lodgmentTel = tourDetailData.tel;
  if (lodgmentTel == '') {
    lodgmentTel = lodgmentDetailData.infoCenter;
  }

  return Column(
    children: [
      // 소개 정보 리스트
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              tourDetailData.overview,
              style: UiConfig.bodyStyle.copyWith(
                fontWeight: UiConfig.semiBoldFont,
              ),
            ),
            // IconTextRow(
            //   icon: Icons.info,
            //   text: tourDetailData.overview,
            // ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.link,
              text: lodgmentDetailData.reservationUrl,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.bed,
              text: lodgmentDetailData.roomCount,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.door_front_door,
              text: lodgmentDetailData.pickup,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.local_parking,
              text: lodgmentDetailData.park,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.beach_access,
              text: lodgmentDetailData.subFacility,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.food_bank,
              text: lodgmentDetailData.foodPlace,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ],
  );
}
