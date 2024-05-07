import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/components/common_app_bar.dart';
import 'package:kovel_app/presentation/components/icon_text_row.dart';
import 'package:kovel_app/presentation/course/components/course_detail_text.dart';
import 'package:kovel_app/presentation/course/components/related_course_list.dart';
import 'package:kovel_app/presentation/course/course_info_view_model.dart';
import 'package:provider/provider.dart';

class CourseInfoScreen extends StatefulWidget {
  const CourseInfoScreen({super.key});

  @override
  State<CourseInfoScreen> createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => context.read<CourseInfoViewModel>().getCourseData(widget.tour.id, widget.tour.contentTypeId));

    //TODO: Tour값 혹은 ID값을 받아서 적용
    Future.microtask(() => context.read<CourseInfoViewModel>().fetchCourseData(2022929, 25));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CourseInfoViewModel>();
    return Scaffold(
      appBar: CommonAppBar(title: viewModel.tourDetailData.first.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(viewModel.tourDetailData.first.imagePath),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CourseDetailText(
                    badgeTitle: '가족코스', //TODO: contentTypeId에 따라서 badgeTitle 조정
                    title: viewModel.tourDetailData.first.title,
                    overview: viewModel.tourDetailData.first.overview,
                  ),
                  SizedBox(height: 16),
                  Divider(height: 1, color: UiConfig.black.shade500),
                  SizedBox(height: 16),
                  viewModel.courseDetailData.first.takeTime == ''
                      ? Container()
                      : IconTextRow(icon: Icons.timelapse, text: viewModel.courseDetailData.first.takeTime),
                  viewModel.courseDetailData.first.distance == ''
                      ? Container()
                      : IconTextRow(icon: Icons.directions_run, text: viewModel.courseDetailData.first.distance),
                  SizedBox(height: 16),
                  Divider(height: 1, color: UiConfig.black.shade500),
                  SizedBox(height: 16),
                  RelatedCourseList(courseDetailInfoData: viewModel.courseDetailInfoData)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
