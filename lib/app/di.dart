import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:temp_package_name/app/base_widget/loading_bloc/loading_bloc.dart';
import 'package:temp_package_name/presentation/home/bloc/home_bloc.dart';
import 'package:temp_package_name/presentation/login/bloc/login_bloc.dart';
import 'package:temp_package_name/presentation/resource/theme/bloc/theme_bloc.dart';
import 'package:temp_package_name/presentation/splash/splash.dart';


final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>());
  getIt.registerSingleton<ThemeBloc>(ThemeBloc());
  getIt.registerSingleton<LoadingBloc>(LoadingBloc());
  getIt.registerSingleton<SplashBloc>(SplashBloc());
  getIt.registerSingleton<LoginBloc>(LoginBloc());
  getIt.registerSingleton<HomeBloc>(HomeBloc());
}

T findInstance<T extends Object>() {
  return getIt<T>();
}


