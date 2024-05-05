import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../config/ui_config.dart';
import '../../components/common_text.dart';
import 'contents_detail_view_model.dart';
import 'lodgment_detail_view.dart';
import 'restaurant_detail_view.dart';
import 'shopping_detail_view.dart';

class ContentsDetailScreen extends StatefulWidget {
  const ContentsDetailScreen({super.key});

  @override
  State<ContentsDetailScreen> createState() => _ContentsDetailScreenState();
}

class _ContentsDetailScreenState extends State<ContentsDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<ContentsDetailViewModel>().getTourDetailData());
  }

  @override
  Widget build(BuildContext context) {
    // viewModel 상태 관찰
    final viewModel = context.watch<ContentsDetailViewModel>();

    // contentId 값에 따라 꽂힐 위젯을 저장할 변수
    Widget detailView;

    // 공통 정보에 번호 정보가 빈값일 때, 소개 정보의 번호를 담기 위한 변수
    String detailTel = viewModel.tourDetailData?.tel ?? '';
    ImageProvider imageProvider;

    // imagePath가 null일 때 보여줄 기본 이미지(임시) 설정
    if (viewModel.tourDetailData?.imagePath != null &&
        viewModel.tourDetailData?.imagePath != '') {
      imageProvider = NetworkImage(viewModel.tourDetailData!.imagePath);
    } else {
      imageProvider =
          const AssetImage('assets/images/blank_image.png');
    }

    // detailView에 contentId에 따라 꽂힐 위젯 저장
    if (viewModel.restaurantDetailData != null) {
      detailView = restaurantDetailView(
          context, viewModel.tourDetailData!, viewModel.restaurantDetailData!);

      detailTel = viewModel.restaurantDetailData?.infoCenter ?? '정보 없음';
    } else if (viewModel.lodgmentDetailData != null) {
      detailView = lodgmentDetailView(
          context, viewModel.tourDetailData!, viewModel.lodgmentDetailData!);

      detailTel = viewModel.lodgmentDetailData?.infoCenter ?? '정보 없음';
    } else if (viewModel.shoppingDetailData != null) {
      detailView = shoppingDetailView(
          context, viewModel.tourDetailData!, viewModel.shoppingDetailData!);

      detailTel = viewModel.shoppingDetailData?.infoCenter ?? '정보 없음';
    } else {
      detailView = const Text('빈 페이지');
    }

    return Scaffold(
      appBar: CommonAppBar(title: viewModel.tourDetailData?.title ?? ''),
      body: viewModel.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 공통 정보 리스트
                        CommonText(
                          badgeTitle: viewModel.tourDetailData?.contentType.text ?? '',
                          title: viewModel.tourDetailData?.title ?? '',
                          tel: detailTel,
                          address: viewModel.tourDetailData?.address1 ?? '',
                        ),

                        // 좋아요 버튼
                        InkWell(
                          onTap: () {
                            viewModel.toggleFavorite();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 0.0, 16.0, 16.0),
                            child: Icon(
                              Icons.favorite,
                              size: 24.0,
                              color: viewModel.isFavorite
                                  ? UiConfig.primaryColor
                                  : UiConfig.black.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 디바이더
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    child: Divider(
                        thickness: 1,
                        height: 1,
                        color: UiConfig.black.shade500),
                  ),

                  // 소개 정보 위젯
                  detailView,
                ],
              ),
            ),
    );
  }
}
