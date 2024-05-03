import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/info_text.dart';
import 'package:kovel_app/presentation/detail_screen/culture_location/culture_location_info_view_model.dart';
import 'package:provider/provider.dart';

class CultureLocationInfoScreen extends StatefulWidget {
  final int id;
  final int contentTypeId;
  final String title;

  CultureLocationInfoScreen(
      {super.key,
      required this.id,
      required this.contentTypeId,
      required this.title});

  @override
  State<CultureLocationInfoScreen> createState() =>
      _CultureLocationInfoScreenState();
}

class _CultureLocationInfoScreenState extends State<CultureLocationInfoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => {
          context
              .read<CultureLocationInfoViewModel>()
              .getDetailData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CultureLocationInfoViewModel>();
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
                        fit: BoxFit.cover,
                        viewModel.tourDetailData.first.imagePath),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CommonText(
                              badgeTitle: viewModel
                                  .tourDetailData.first.contentType.name,
                              title: viewModel.tourDetailData.first.title,
                              tel: (viewModel.tourDetailData.first.tel == '')
                                  ? viewModel.cultureLocationDetailData.first
                                      .infoCenter
                                  : '',
                              address: viewModel.tourDetailData.first.address1,
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
                        ...viewModel.widgets,
                        widget.contentTypeId == 12
                            ? SizedBox()
                            : InfoSection(
                                id: widget.id,
                                contentTypeId: widget.contentTypeId,
                                title: widget.title,
                              ),
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
  final String title;

  const InfoSection(
      {super.key,
      required this.id,
      required this.contentTypeId,
      required this.title});

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => {
          context
              .read<CultureLocationInfoViewModel>()
              .getInfoData(widget.id, widget.contentTypeId),
        });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CultureLocationInfoViewModel>();
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
                  children: viewModel.cultureLocationInfoData
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
