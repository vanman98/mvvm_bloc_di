
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:temp_package_name/presentation/resource/theme/theme_manager/theme_manager.dart';
import '../../../../app/app.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<InitThemeEvent>(_onInit);
    on<ChangedThemeEvent>(_onChanged);
  }
  _onInit(InitThemeEvent event, emit) {
    bool isDark = AppPrefs.themeMode == ThemeManager.darkMode;
    emit(state.update(isDark: isDark));
  }

  _onChanged(ChangedThemeEvent event, emit) {
    if (event.isNeedUpdateStatusbar) {}
    AppPrefs.themeMode =
        event.isDark ? ThemeManager.darkMode : ThemeManager.lightMode;
    emit(state.update(isDark: event.isDark));
  }
}
