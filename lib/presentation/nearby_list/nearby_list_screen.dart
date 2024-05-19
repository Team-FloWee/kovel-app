import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/core/utils/language_util.dart';
import 'package:kovel_app/domain/model/tour.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/presentation/components/content_title.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/nearby_list/nearby_list_view_model.dart';
import 'package:provider/provider.dart';

class NearbyListScreen extends StatefulWidget {
  final List<Tour> _locationBasedList;
  const NearbyListScreen({super.key, required List<Tour> locationBasedList}) : _locationBasedList = locationBasedList;

  @override
  State<NearbyListScreen> createState() => _NearbyListScreenState();
}

class _NearbyListScreenState extends State<NearbyListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final userProvider = context.read<UserProvider>();
      context.read<NearbyListViewModel>().onFetch(widget._locationBasedList, LanguageUtil().getLanguage(userProvider.user.language));
    });
  }

  final ScrollController _commonDataScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NearbyListViewModel>();
    return Scaffold(
      appBar: const CommonAppBar(title: '내주변'),
      body: SafeArea(
        child: viewModel.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget._locationBasedList.length.toString()),
                    Text(widget._locationBasedList.first.mapx.toString()),
                    Text(widget._locationBasedList.first.mapy.toString()),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: widget._locationBasedList
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      'detail',
                                      queryParameters: {'id': e.id, 'contentTypeId': e.contentType.id, 'title': e.title},
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      viewModel.isLoading
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
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
    );
  }
}
