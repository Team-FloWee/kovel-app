import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kovel_app/config/firebase_options.dart';
import 'package:kovel_app/di/di_setup.dart';
import 'package:kovel_app/presentation/location_list/location_list_screen.dart';
import 'package:provider/provider.dart';

import 'data/data_source/tour_info_data_source_impl.dart';
import 'data/repository_impl/unified_detail_repositorty_impl.dart';
import 'presentation/detail_screen/detail_screen.dart';
import 'presentation/detail_screen/detail_screen_view_model.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  // kakao 초기화
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: dotenv.get('KAKAO_NATIVE_APP_KEY'),
    javaScriptAppKey: dotenv.get('KAKAO_JAVASCRIPT_APP_KEY'),
  );

  // firebase 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Inter',
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ChangeNotifierProvider(
            create: (_) => DetailScreenViewModel(
                // 음식점 id : 404114, 1607698, 3076134, 2929595, 3060918
                // 숙박 id : 2465071, 142785, 2671267, 2627867, 1865597
                // 쇼핑 id : 2750144, 2750143, 1433504, 2930927, 2928947, 732484, 132215
                unifiedDetailRepository: UnifiedDetailRepositoryImpl(
                    tourInfoDataSource: TourInfoDataSourceImpl())),
            child: DetailScreen(
              id: 2928947,
              contentTypeId: 38,
              title: '음식점',
            ),
          ),
        );
      },
    );
  }
}
