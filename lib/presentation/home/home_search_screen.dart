import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/common_text.dart';
import 'package:kovel_app/core/utils/archived_util.dart';
import 'package:kovel_app/presentation/components/favorite_image.dart';
import 'package:kovel_app/presentation/home/home_search_view_model.dart';
import 'package:provider/provider.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  FocusNode searchFocusNode = FocusNode();
  bool isFocused = false;
  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {
        isFocused = searchFocusNode.hasFocus;
      });
    });
    Future.microtask(() => _searchDataScrollController.addListener(() {
          _onCourseDataScroll();
        }));
  }

  final ScrollController _searchDataScrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    searchFocusNode.dispose();
    _searchDataScrollController.dispose();
  }

  void _onCourseDataScroll() {
    if (_searchDataScrollController.position.pixels == _searchDataScrollController.position.maxScrollExtent && !context.read<HomeSearchViewModel>().isSearchDataLoading) {
      context.read<HomeSearchViewModel>().onSearchMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeSearchViewModel>();
    final textController = TextEditingController();
    return Scaffold(
        appBar: CommonAppBar(
          title: '홈 검색',
          controller: _searchDataScrollController,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              controller: _searchDataScrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: textController,
                      focusNode: searchFocusNode,
                      onTap: viewModel.onLoadSearchHistory,
                      onFieldSubmitted: (value) {
                        viewModel.onSearch(value);
                      },
                      // onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD7D7D7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD7D7D7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50))),
                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                          hintText: "원하는 정보를 검색하세요".tr(),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 14.0),
                            child: Icon(Icons.search),
                          ),
                          suffixIcon: isFocused
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      textController.clear();
                                    });
                                  },
                                  child: const Icon(
                                    Icons.cancel_rounded,
                                  ),
                                )
                              : null),
                    ),
                  ),
                  if (isFocused) ...[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.searchHistoryList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minVerticalPadding: 0,
                          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                          title: Column(
                            children: [
                              GestureDetector(
                                onTap: () => textController.text = viewModel.searchHistoryList[index],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          viewModel.searchHistoryList[index],
                                          style: UiConfig.bodyStyle,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          viewModel.onRemoveSearchHistory(index);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          size: 20,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
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
                        viewModel.isMoreDataLoading != true
                            ? const SizedBox()
                            : const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: UiConfig.primaryColor,
                                  ),
                                ),
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
