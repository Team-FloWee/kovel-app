import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/info_text.dart';
import 'package:kovel_app/presentation/detail_screen/detail_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/method/get_cached_network_image.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final int contentTypeId;
  final String title;

  const DetailScreen({super.key, required this.id, required this.contentTypeId, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => {
          context.read<DetailScreenViewModel>().getDetailData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailScreenViewModel>();
    if (viewModel.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (viewModel.error != null) {
      return Scaffold(
        appBar: CommonAppBar(title: widget.title),
        body: RefreshIndicator(
          onRefresh: () async {
            if (!viewModel.isLoading) {
              context.read<DetailScreenViewModel>().onRefresh();
              context.read<DetailScreenViewModel>().getDetailData(widget.id, widget.contentTypeId);
            }
          },
          child: SingleChildScrollView(
              // 짧은 화면에서 스크롤 먹음
              physics: const AlwaysScrollableScrollPhysics(),
              child: Text('error ${viewModel.error.toString()}')),
        ),
      );
    } else {
      // 이 화면이 나오면 위의 조건이 이상한 것
      const Text('예외 상황 페이지 확인이 필요');
    }

    return Scaffold(
      appBar: CommonAppBar(title: widget.title),
      body: viewModel.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(fit: BoxFit.cover, viewModel.tourDetailData.first.imagePath),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CommonText(
                              badgeTitle: viewModel.detailData.first.contentType.name,
                              title: viewModel.tourDetailData.first.title,
                              tel: (viewModel.tourDetailData.first.tel == '') ? viewModel.detailData.first.infoCenter : '',
                              address: viewModel.tourDetailData.first.address1,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18, bottom: 16),
                          child: Divider(thickness: 1, height: 1, color: UiConfig.black.shade500),
                        ),
                        ...viewModel.widgets,
                        widget.contentTypeId == 12 || widget.contentTypeId == 14 || widget.contentTypeId == 15 || widget.contentTypeId == 28
                            ? InfoSection(
                                id: widget.id,
                                contentTypeId: widget.contentTypeId,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class InfoSection extends StatefulWidget {
  final int id;
  final int contentTypeId;

  const InfoSection({
    super.key,
    required this.id,
    required this.contentTypeId,
  });

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => {
          context.read<DetailScreenViewModel>().getInfoData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailScreenViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 16),
          child: Divider(thickness: 1, height: 1, color: UiConfig.black.shade500),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: UiConfig.black.shade500,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: UiConfig.black.shade500,
                ),
                child: Column(
                  children: viewModel.infoData
                      .map(
                        (e) => InfoText(title: e.infoName, contents: e.infoText),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
