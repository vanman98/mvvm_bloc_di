import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/app/app.dart';
import 'package:temp_package_name/presentation/resource/resource.dart';
import 'package:temp_package_name/presentation/splash/splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = findInstance<SplashBloc>();
  @override
  void initState() {
    super.initState();
    controller.add(InitSplashEvent());
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2), () {
    //   context.push(RouterManager.home);
    // });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Text('SPLASH', style: Theme.of(context).textTheme.labelLarge)),
    );
  }
}
