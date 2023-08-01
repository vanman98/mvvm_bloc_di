import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/app.dart';
import 'presentation/resource/resource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initEasyLocalization();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: []); //Ẩn hoặc hiện (status bar) và  (navigation bar) của hệ điều hành
  await SystemChrome.setPreferredOrientations(
      DeviceOrientation.values); //Được sử dụng để đặt các hướng màn hình
  await AppPrefs().initialize();
  bloc.Bloc.observer = AppBlocObserver();
  getItSetup();
  await initializeNotification();
  return runApp(wrapEasyLocalization(child: const _App()));
}

class _App extends StatefulWidget {
  const _App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  void initState() {
    super.initState();
    findInstance<ThemeBloc>().add(InitThemeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: OverlaySupport(
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return WidgetThemeWraper(
              builder: (ThemeState themeState) => MaterialApp.router(
                routerConfig: RouterManager.routers,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: themeState.theme,
              ),
            );
          },
        ),
      ),
    );
  }
}
