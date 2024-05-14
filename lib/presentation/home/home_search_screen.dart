import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/home/home_search_view_model.dart';
import 'package:provider/provider.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeSearchViewModel>();

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  onFieldSubmitted: (value) {
                    viewModel.onSearch(value);
                  },
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD7D7D7),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    hintText: "원하는 정보를 검색하세요",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 14.0),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      children: viewModel.searchDataList
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  onTap: () {
                                    print('id: ${e.id}, contentTypeId: ${e.contentType.id}, title: ${e.title}');
                                    context.pushNamed('detail', queryParameters: {'id': e.id.toString(), 'contentTypeId': e.contentType.id, 'title': e.title});
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
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
