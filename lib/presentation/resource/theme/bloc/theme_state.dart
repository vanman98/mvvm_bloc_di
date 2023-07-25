part of 'theme_bloc.dart';

class ThemeState {
  bool isDark;

  ThemeState({this.isDark = false});

  ThemeData get theme {
    return (isDark ? ThemeManager.getDarkModeTheme() : ThemeManager.getLightModeTheme());
  }

  ThemeState update({bool? isDark}) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
    );
  }
}
