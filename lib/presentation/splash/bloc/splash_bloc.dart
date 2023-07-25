import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {});
    on<InitSplashEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2), () {
        navigatorKey.currentContext!.push(RouterManager.home);
      });
    });
  }
}
