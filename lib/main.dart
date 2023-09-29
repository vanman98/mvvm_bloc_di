import 'package:base_getx/presentation/resource/resource.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app/app.dart';
import 'data/local_data/app_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: []); //Ẩn hoặc hiện (status bar) và  (navigation bar) của hệ điều hành
  await SystemChrome.setPreferredOrientations(
      DeviceOrientation.values); //Được sử dụng để đặt các hướng màn hình
  await AppPrefs().initialize();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: OverlaySupport(
          child: ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
              useInheritedMediaQuery: true,
              builder: (_, child) {
                return GetMaterialApp(
                  title: 'BASE GETX',
                  theme: AppPrefs.isLightMode?ThemeManager.getLightModeTheme():ThemeManager.getDarkModeTheme(),
                  debugShowCheckedModeBanner: false,
                  useInheritedMediaQuery: true,
                  defaultTransition: Transition.rightToLeft,
                  locale: TranslationService.locale,
                  fallbackLocale: TranslationService.fallbackLocale,
                  translations: TranslationService(),
                  initialRoute: RouterManager.splash,
                  getPages: RouterManager.routers,
                  supportedLocales: TranslationService.appSupportedLocales,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                );
              })),
    );
  }
}
