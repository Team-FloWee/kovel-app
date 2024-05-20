// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/nearby_list/nearby_list_view_model.dart';

class NearbyListScreen extends StatefulWidget {
  final String mapX;
  final String mapY;
  final String radius;

  const NearbyListScreen({
    super.key,
    required this.mapX,
    required this.mapY,
    required this.radius,
  });

  @override
  State<NearbyListScreen> createState() => _NearbyListScreenState();
}

class _NearbyListScreenState extends State<NearbyListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      //final userProvider = context.read<UserProvider>();
      context.read<NearbyListViewModel>().onFetch(longitude: widget.mapX, latitude: widget.mapY, radius: widget.radius);
      return _nearbyScrollController.addListener(() {
        _onNearbyDataScroll();
      });
    });
  }

  final ScrollController _nearbyScrollController = ScrollController();

  void _onNearbyDataScroll() {
    //final userProvider = context.read<UserProvider>();
    if (_nearbyScrollController.position.pixels == _nearbyScrollController.position.maxScrollExtent && !context.read<NearbyListViewModel>().isNearbyDataLoading) {
      context.read<NearbyListViewModel>().fetchMoreNearbyData(longitude: widget.mapX, latitude: widget.mapY, radius: widget.radius);
    }
  }

  @override
  void dispose() {
    _nearbyScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NearbyListViewModel>();
    return Scaffold(
      appBar: CommonAppBar(
        title: '내주변',
        controller: _nearbyScrollController,
      ),
      body: SafeArea(
        child: viewModel.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                controller: _nearbyScrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: List.generate(
                          viewModel.locationBasedList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: InkWell(
                              onTap: () {
                                context.pushNamed(
                                  'detail',
                                  queryParameters: {
                                    'id': viewModel.locationBasedList[index].id.toString(),
                                    'contentTypeId': viewModel.locationBasedList[index].contentType.id.toString(),
                                    'title': viewModel.locationBasedList[index].title.toString()
                                  },
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FavoriteImage(
                                    archived: ArchivedUtil.getArchived(tour: viewModel.locationBasedList[index]),
                                    imageSize: 145,
                                  ),
                                  const SizedBox(width: 8),
                                  CommonText(
                                    badgeTitle: viewModel.locationBasedList[index].contentType.name,
                                    title: viewModel.locationBasedList[index].title,
                                    tel: viewModel.locationBasedList[index].tel,
                                    address: viewModel.locationBasedList[index].address1,
                                    distance: viewModel.distanceList[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    viewModel.isNearbyDataLoading != true ? const SizedBox() : const Center(child: CircularProgressIndicator()),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
    );
  }
}
