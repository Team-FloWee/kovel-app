import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/di/di_setup.dart';
import 'package:kovel_app/domain/model/user.dart';
import 'package:kovel_app/presentation/archived/archived_screen.dart';
import 'package:kovel_app/presentation/archived/archived_view_model.dart';
import 'package:kovel_app/presentation/course_list/course_list_screen.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';
import 'package:kovel_app/presentation/detail/detail_screen.dart';
import 'package:kovel_app/presentation/detail/detail_view_model.dart';
import 'package:kovel_app/presentation/home/home_screen.dart';
import 'package:kovel_app/presentation/home/home_view_model.dart';
import 'package:kovel_app/presentation/location_list/location_list_screen.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';
import 'package:kovel_app/presentation/login/login_screen.dart';
import 'package:kovel_app/presentation/login/login_view_model.dart';
import 'package:kovel_app/presentation/my_page/my_page_edit_screen.dart';
import 'package:kovel_app/presentation/my_page/my_page_screen.dart';
import 'package:kovel_app/presentation/my_page/my_page_view_model.dart';
import 'package:kovel_app/presentation/sign_up/sign_up_screen.dart';
import 'package:kovel_app/presentation/sign_up/sign_up_view_model.dart';
import 'package:kovel_app/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: ChangeNotifierProvider(
              create: (context) => getIt<HomeViewModel>(),
              child: HomeScreen(),
            ),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            });
      },
    ),
    GoRoute(
        path: '/splash',
        builder: (context, state) {
          return SplashScreen();
        }),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => getIt<LoginViewModel>(),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/mypage',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: ChangeNotifierProvider(
              create: (context) => MyPageViewModel(),
              child: MyPageScreen(),
            ),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            });
      },
    ),
    GoRoute(
      path: '/mypageedit',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => MyPageViewModel(),
          child: const MyPageEditScreen(),
        );
      },
    ),
    GoRoute(
      path: '/archived',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: ChangeNotifierProvider(
              create: (context) => ArchivedViewModel(userRepository: getIt()),
              child: ArchivedScreen(),
            ),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            });
      },
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final id = int.parse(state.uri.queryParameters['id']!);
        final contentTypeId =
            int.parse(state.uri.queryParameters['contentTypeId']!);
        final title = state.uri.queryParameters['title']!;

        return ChangeNotifierProvider(
          create: (context) => getIt<DetailViewModel>(),
          child:
              DetailScreen(id: id, contentTypeId: contentTypeId, title: title),
        );
      },
    ),
    GoRoute(
      path: '/locationList',
      name: 'locationList',
      builder: (context, state) {
        //final areaCode = state.uri.queryParameters['areaCode']!;
        return ChangeNotifierProvider(
          create: (context) => getIt<LocationListViewModel>(),
          child: LocationListScreen(
            areaCode: '1',
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
          create: (context) => getIt<CourseListViewModel>(),
          child: CourseListScreen(
            areaCode: areaCode,
          ),
        );
      },
    ),
    GoRoute(
        path: '/signUp',
        name: 'signUp',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => getIt<SignUpViewModel>(),
            child: SignUpScreen(
              user: state.extra as User,
            ),
          );
        })
  ],
);
