import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/presentation/home/home_screen.dart';
import 'package:temp_package_name/presentation/splash/splash.dart';
import '../../app/app.dart';

GlobalKey<NavigatorState> get navigatorKey =>
    findInstance<GlobalKey<NavigatorState>>();

class RouterManager {
  RouterManager._();
  static const splash = '/splash';
  static const home = '/home';

  //////////////////////////////////////////////////
  static final routers = GoRouter(
    initialLocation: splash,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: 'splash',
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'home',
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
