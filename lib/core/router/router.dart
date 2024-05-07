import 'package:go_router/go_router.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/domain/use_case/get_area_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_detail_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_info_data_use_case.dart';
import 'package:kovel_app/presentation/course/course_info_screen.dart';
import 'package:kovel_app/presentation/course/course_info_view_model.dart';
import 'package:kovel_app/presentation/course_list/course_list_screen.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';
import 'package:kovel_app/presentation/detail_screen/detail_screen.dart';
import 'package:kovel_app/presentation/detail_screen/detail_screen_view_model.dart';
import 'package:kovel_app/presentation/location_list/location_list_screen.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/repository_impl/tour_info_repository_impl.dart';

final goRouter = GoRouter(
  initialLocation: '/locationList',
  routes: [
    //
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) {
    //     return ChangeNotifierProvider(
    //       create: (context) => HomeViewModel(
    //         tourInfoRepository: TourInfoRepositoryImpl(
    //           tourInfoDataSource: TourInfoDataSourceImpl(),
    //         ),
    //       ),
    //         child: const HomeScreen(),
    //     );
    //   },
    // ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final id = int.parse(state.uri.queryParameters['id']!);
        final contentTypeId =
            int.parse(state.uri.queryParameters['contentTypeId']!);
        final title = state.uri.queryParameters['title']!;

        return ChangeNotifierProvider(
          create: (context) => DetailScreenViewModel(
            getCommonDataUseCase: GetCommonDataUseCase(
              tourInfoRepository: TourInfoRepositoryImpl(
                tourInfoDataSource: TourInfoDataSourceImpl(),
              ),
            ),
            getDetailDataUseCase: GetDetailDataUseCase(
              tourInfoRepository: TourInfoRepositoryImpl(
                tourInfoDataSource: TourInfoDataSourceImpl(),
              ),
            ),
            getInfoDataUseCase: GetInfoDataUseCase(
              tourInfoRepository: TourInfoRepositoryImpl(
                tourInfoDataSource: TourInfoDataSourceImpl(),
              ),
            ),
          ),
          child:
              DetailScreen(id: id, contentTypeId: contentTypeId, title: title),
        );
      },
    ),
    GoRoute(
      path: '/locationList',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => LocationListViewModel(
            tourInfoRepository: TourInfoRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
          child: LocationListScreen(
            areaCode: '32',
          ),
        );
      },
    ),
    GoRoute(
      path: '/courseList',
      name: 'courseList',
      builder: (context, state) {
        final areaCode = state.uri.queryParameters['areaCode']!;
        return ChangeNotifierProvider(
          create: (context) => CourseListViewModel(
              getCommonDataUseCase: GetCommonDataUseCase(
                  tourInfoRepository: TourInfoRepositoryImpl(
                      tourInfoDataSource: TourInfoDataSourceImpl())),
              getAreaDataUseCase: GetAreaDataUseCase(
                  tourInfoRepository: TourInfoRepositoryImpl(
                      tourInfoDataSource: TourInfoDataSourceImpl()))),
          child: CourseListScreen(
            areaCode: areaCode,
          ),
        );
      },
    ),
    GoRoute(
      path: '/courseInfo',
      builder: (context, state) {
        final id = int.parse(state.uri.queryParameters['id']!);
        return ChangeNotifierProvider(
          create: (context) => CourseInfoViewModel(
            tourInfoRepository: TourInfoRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
          child: CourseInfoScreen(), //TODO 파라미터 설정되면 넣기
        );
      },
    ),
  ],
);
