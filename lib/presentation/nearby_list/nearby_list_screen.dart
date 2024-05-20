import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/nearby_list/nearby_list_view_model.dart';

class NearbyListScreen extends StatefulWidget {
  String mapX;
  String mapY;
  String radius;

  NearbyListScreen({
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
      appBar: const CommonAppBar(title: '내주변'),
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
                        children: viewModel.locationBasedList
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      'detail',
                                      queryParameters: {'id': e.id.toString(), 'contentTypeId': e.contentType.id.toString(), 'title': e.title.toString()},

                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      viewModel.isNearbyDataLoading
                                          ? const Center(child: CircularProgressIndicator())
                                          : FavoriteImage(
                                              archived: ArchivedUtil.getArchived(tour: e),
                                              imageSize: 145,
                                            ),
                                      const SizedBox(width: 8),
                                      CommonText(
                                        badgeTitle: e.contentType.name,
                                        title: e.title,
                                        tel: e.tel,
                                        address: e.address1,
                                        distance: '5',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
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
