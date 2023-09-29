import 'package:base_getx/presentation/home/home.dart';
import 'package:base_getx/presentation/home/home_controller.dart';
import 'package:get/get.dart';
import '../presentation.dart';

class RouterManager {
  RouterManager._();
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  //////////////////////////////////////////////////
  static final routers = [
    GetPage(
        name: splash,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200),
        page: () => SplashScreen(),
        binding: BindingsBuilder.put(() => SplashController())),
    GetPage(
        name: home,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200),
        page: () => HomeScreen(),
        binding: BindingsBuilder.put(() => HomeController())),
  ];
}
