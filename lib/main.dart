import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kovel_app/config/firebase_options.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/auth/user_provider.dart';
import 'package:kovel_app/core/router/router.dart';
import 'package:kovel_app/di/di_setup.dart';
import 'package:provider/provider.dart';

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

  // Easy Localization 초기화
  await EasyLocalization.ensureInitialized();

  diSetup();
  runApp(
    EasyLocalization(
      // 지원하는 로케일 리스트 ('영어', '미국'), ('한국어', '한국')
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
      // 번역 파일이 위치한 경로
      path: 'assets/translations',
      // 기본적으로 사용할 로케일 지정
      // TODO: 유저 언어 설정에 따라 언어를
      fallbackLocale: const Locale('ko', 'KR'),
      child: const MyApp(),
    ),
  );
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
        return ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: goRouter,
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
              colorScheme: ColorScheme.fromSeed(
                  seedColor: UiConfig.primaryColor,
                  primary: UiConfig.primaryColor),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
