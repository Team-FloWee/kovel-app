import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/favorite_icon.dart';
import 'package:kovel_app/presentation/components/info_text.dart';
import 'package:kovel_app/presentation/components/translate/context_menu.dart';
import 'package:kovel_app/presentation/detail/components/course/related_course_list.dart';
import 'package:kovel_app/presentation/detail/detail_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/method/get_cached_network_image.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final int contentTypeId;
  final String title;

  const DetailScreen(
      {super.key,
      required this.id,
      required this.contentTypeId,
      required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => {
          context
              .read<DetailViewModel>()
              .getDetailData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
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
              context.read<DetailViewModel>().onRefresh();
              context
                  .read<DetailViewModel>()
                  .getDetailData(widget.id, widget.contentTypeId);
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
      Text('예외 상황 페이지 확인이 필요'.tr());
    }

    return Scaffold(
      appBar: CommonAppBar(title: widget.title),
      body: RefreshIndicator(
        onRefresh: () async {
          if (!viewModel.isLoading) {
            viewModel.onRefresh();
            viewModel.getDetailData(widget.id, widget.contentTypeId);
          }
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              getCachedNetworkImage(
                  imagePath: viewModel.tourDetailData.imagePath),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          badgeTitle: viewModel.tourDetailData.contentType
                                      .contentTypeId ==
                                  25
                              ? viewModel.tourDetailData.categoryType.name
                              : viewModel.tourDetailData.contentType.name,
                          title: viewModel.tourDetailData.title,
                          tel: (viewModel.tourDetailData.tel == '')
                              ? viewModel.detailData.infoCenter
                              : '',
                          address: viewModel.tourDetailData.address1,
                        ),
                        FavoriteIcon(
                          archived: ArchivedUtil.getArchived(
                              tourDetail: viewModel.tourDetailData),
                        ),
                      ],
                    ),
                    widget.contentTypeId == 25
                        ? Text(viewModel.tourDetailData.overview,
                            style: UiConfig.bodyStyle)
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 16),
                      child: Divider(
                          thickness: 1,
                          height: 1,
                          color: UiConfig.black.shade500),
                    ),
                    widget.contentTypeId != 32
                        ? const SizedBox()
                        : Column(
                            children: [
                              ContextMenu(
                                text: viewModel.tourDetailData.overview,
                                child: Text(
                                  viewModel.tourDetailData.overview,
                                  style: UiConfig.bodyStyle.copyWith(
                                    fontWeight: UiConfig.regularFont,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                    ...viewModel.widgets,
                    widget.contentTypeId == 12 ||
                            widget.contentTypeId == 14 ||
                            widget.contentTypeId == 15 ||
                            widget.contentTypeId == 25 ||
                            widget.contentTypeId == 28
                        ? InfoSection(
                            id: widget.id,
                            contentTypeId: widget.contentTypeId,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
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
          context
              .read<DetailViewModel>()
              .getInfoData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 16),
          child:
              Divider(thickness: 1, height: 1, color: UiConfig.black.shade500),
        ),
        widget.contentTypeId != 25
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: UiConfig.black.shade500,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16, top: 16, right: 16, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: UiConfig.black.shade500,
                      ),
                      child: Column(
                        children: viewModel.infoData
                            .map(
                              (e) => InfoText(
                                  title: e.infoName, contents: e.infoText),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            : RelatedCourseList(courseInfoData: viewModel.infoData)
      ],
    );
  }
}
