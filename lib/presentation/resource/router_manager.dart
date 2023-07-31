import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/presentation/home/home_screen.dart';
import 'package:temp_package_name/presentation/login/login_screen.dart';
import 'package:temp_package_name/presentation/splash/splash.dart';
import '../../app/app.dart';

GlobalKey<NavigatorState> get navigatorKey =>
    findInstance<GlobalKey<NavigatorState>>();

class RouterManager {
  RouterManager._();
  static const String splash = 'splash';
  static const String home = 'home';
  static const String login = 'login';
  static const String register = 'register';

  //////////////////////////////////////////////////
  static final routers = GoRouter(
    initialLocation: '/splash',
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          name: splash,
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
          routes: [
            GoRoute(
              name: login,
              path: login,
              builder: (context, state) {
                return const LoginScreen();
              },
              routes: [
                 GoRoute(
              name: home,
              path: home,
              builder: (context, state) {
                return HomeScreen(name: state.queryParameters['name']);
              },
            ),
              ]
            ),
           
          ]),
    ],
  );
}
