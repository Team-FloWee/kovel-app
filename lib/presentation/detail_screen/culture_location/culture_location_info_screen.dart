import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/icon_text_row.dart';
import 'package:kovel_app/presentation/components/info_text.dart';
import 'package:kovel_app/presentation/detail_screen/culture_location/culture_location_info_view_model.dart';
import 'package:provider/provider.dart';

class CultureLocationInfoScreen extends StatefulWidget {
  final int id;
  final int contentTypeId;
  const CultureLocationInfoScreen(
      {super.key, required this.id, required this.contentTypeId});

  @override
  State<CultureLocationInfoScreen> createState() =>
      _CultureLocationInfoScreenState();
}

class _CultureLocationInfoScreenState extends State<CultureLocationInfoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<CultureLocationInfoViewModel>()
          .getCultureLocationData(widget.id, widget.contentTypeId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CultureLocationInfoViewModel>();
    return Scaffold(
      appBar: CommonAppBar(title: viewModel.tourDetailData.first.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://images.unsplash.com/photo-1472791108553-c9405341e398?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D"),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CommonText(
                      badgeTitle: '문화시설',
                      title: viewModel.tourDetailData.first.title,
                      tel: viewModel.tourDetailData.first.tel,
                      address: viewModel.tourDetailData.first.address1),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 16),
                    child: Divider(
                        thickness: 1,
                        height: 1,
                        color: UiConfig.black.shade500),
                  ),
                  IconTextRow(
                      icon: Icons.monetization_on,
                      text: viewModel.cultureLocationDetailData.first.useFee),
                  IconTextRow(
                      icon: Icons.access_time_filled,
                      text: viewModel.cultureLocationDetailData.first.useTime),
                  IconTextRow(
                      icon: Icons.door_front_door,
                      text: viewModel.cultureLocationDetailData.first.restDay),
                  IconTextRow(
                      icon: Icons.local_parking,
                      text: viewModel.cultureLocationDetailData.first.parking),
                  IconTextRow(
                      icon: Icons.timelapse,
                      text:
                          viewModel.cultureLocationDetailData.first.spendTime),
                  IconTextRow(
                      icon: Icons.pets,
                      text:
                          viewModel.cultureLocationDetailData.first.petAllowed),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 16),
                    child: Divider(
                        thickness: 1,
                        height: 1,
                        color: UiConfig.black.shade500),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: UiConfig.black.shade500,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 16, top: 16, right: 16, bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: UiConfig.black.shade500,
                          ),
                          child: Column(
                            children: viewModel.cultureLocationInfoData
                                .map((e) => InfoText(
                                    title: e.infoName, contents: e.infoText))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
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
