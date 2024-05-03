import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/info_text.dart';
import 'package:kovel_app/presentation/detail_screen/detail_screen_view_model.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final int contentTypeId;
  final String title;

  DetailScreen(
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
              .read<DetailScreenViewModel>()
              .getDetailData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailScreenViewModel>();
    return Scaffold(
      appBar: CommonAppBar(title: widget.title),
      body: viewModel.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                        errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/blank_image.png');
                    },
                        fit: BoxFit.cover,
                        viewModel.tourDetailData.first.imagePath),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              badgeTitle:
                                  viewModel.detailData.first.contentType.text,
                              title: viewModel.tourDetailData.first.title,
                              tel: (viewModel.tourDetailData.first.tel == '')
                                  ? viewModel.detailData.first.infoCenter
                                  : '',
                              address: viewModel.tourDetailData.first.address1,
                            ),
                            Transform.translate(
                              offset: Offset(16, -16),
                              child: InkWell(
                                onTap: () {
                                  viewModel.toggleFavorite();
                                },
                                borderRadius: BorderRadius.circular(888.0),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 24.0,
                                    color: viewModel.isFavorite
                                        ? UiConfig.primaryColor
                                        : UiConfig.black.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18, bottom: 16),
                          child: Divider(
                              thickness: 1,
                              height: 1,
                              color: UiConfig.black.shade500),
                        ),
                        // ContentType.lodgment.id != 32
                        viewModel.tourDetailData.first.contentType.id != 32
                            ? SizedBox()
                            : Column(
                                children: [
                                  Text(
                                    viewModel.tourDetailData.first.overview,
                                    style: UiConfig.bodyStyle.copyWith(
                                      fontWeight: UiConfig.regularFont,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                        ...viewModel.widgets,
                        widget.contentTypeId == 12 ||
                                widget.contentTypeId == 14 ||
                                widget.contentTypeId == 15 ||
                                widget.contentTypeId == 28
                            ? InfoSection(
                                id: widget.id,
                                contentTypeId: widget.contentTypeId,
                              )
                            : SizedBox(),
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
          context
              .read<DetailScreenViewModel>()
              .getInfoData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailScreenViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 16),
          child:
              Divider(thickness: 1, height: 1, color: UiConfig.black.shade500),
        ),
        Container(
          padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: UiConfig.black.shade500,
          ),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: UiConfig.black.shade500,
                ),
                child: Column(
                  children: viewModel.infoData
                      .map(
                        (e) =>
                            InfoText(title: e.infoName, contents: e.infoText),
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
