import 'package:go_router/go_router.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/unified_detail_repositorty_impl.dart';
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
import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_view_model.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            tourInfoRepository: TourInfoRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
            child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final contentTypeId = int.parse(state.pathParameters['contentTypeId']!);
        final title = state.pathParameters['title']!;
        return ChangeNotifierProvider(
          create: (context) => DetailScreenViewModel(
            unifiedDetailRepository: UnifiedDetailRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
          child: DetailScreen(id: id, contentTypeId: contentTypeId, title: title),
        );
      },
    ),
    GoRoute(
      path: '/locationList',
      builder: (context, state) {
        final areaCode = state.pathParameters['areaCode']!;
        return ChangeNotifierProvider(
          create: (context) => LocationListViewModel(
            tourInfoRepository: TourInfoRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
          child: LocationListScreen(
             areaCode: areaCode,),
        );
      },
    ),
    GoRoute(
      path: '/courseList',
      builder: (context, state) {
        final areaCode = state.pathParameters['areaCode']!;
        return ChangeNotifierProvider(
          create: (context) => CourseListViewModel(
            tourInfoRepository: TourInfoRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
          child: CourseListScreen(
            areaCode: areaCode,),
        );
      },
    ),
    GoRoute(
      path: '/courseInfo',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ChangeNotifierProvider(
          create: (context) => CourseInfoViewModel(
            tourInfoRepository: TourInfoRepositoryImpl(
              tourInfoDataSource: TourInfoDataSourceImpl(),
            ),
          ),
          child: CourseInfoScreen(
              id: id, ), //TODO 파라미터 설정되면 넣기
        );
      },
    ),
  ],
);
