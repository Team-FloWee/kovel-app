import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/home/home_search_view_model.dart';
import 'package:provider/provider.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeSearchViewModel>();
    final textController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(onTap: () => context.go('/'), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InputHistoryTextField(
                    textEditingController: textController,
                    historyKey: '03',
                    listStyle: ListStyle.Badge,
                    showHistoryIcon: false,
                    lockItems: const ['강원', '충청', '전라', '경상'],
                    backgroundColor: UiConfig.primaryColor,
                    textColor: UiConfig.black.shade100,
                    deleteIconColor: UiConfig.black.shade100,
                    onSubmitted: (value) {
                      viewModel.onSearch(value);
                    },
                    limit: 10,
                    showDeleteIcon: true,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        hintText: "원하는 정보를 검색하세요",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: Icon(Icons.search),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // viewModel.onRefresh();
                            // setState(() {});
                            context.push('/search');
                          },
                          child: const Icon(
                            Icons.cancel_rounded,
                          ),
                        )),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: viewModel.searchDataList
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(bottom: 16.0),
                                        child: InkWell(
                                          onTap: () {
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
                                              CommonText(
                                                badgeTitle: e.contentType.name,
                                                title: e.title,
                                                tel: e.tel,
                                                address: e.address1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
