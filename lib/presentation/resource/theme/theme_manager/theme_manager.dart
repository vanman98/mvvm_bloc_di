import 'package:flutter/material.dart';
import '../../resource.dart';

class ThemeManager {
  ThemeManager._();
  static const darkMode = 'DarkMode';
  static const lightMode = 'LightMode';
  static ThemeData getLightModeTheme() {
    return ThemeData(
        // main colors of the app
        primaryColor: ColorManager.white,
        primaryColorDark: ColorManager.black,
        disabledColor: ColorManager.grey1,
        // ripple color
        splashColor: ColorManager.primaryOpacity70,
        // Button theme
        buttonTheme: ButtonThemeData(
            shape: StadiumBorder(),
            disabledColor: ColorManager.grey1,
            buttonColor: ColorManager.primary,
            splashColor: ColorManager.primaryOpacity70),
        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: getRegularStyle(color: ColorManager.white),
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12)))),
        // Text theme
        textTheme: TextTheme(
          headlineLarge:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
          bodyLarge: getRegularStyle(
              color: ColorManager.grey1, fontSize: FontSize.s16),
          labelLarge:
              getBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
          labelMedium:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
          labelSmall: getMediumStyle(color: ColorManager.black),
        ),
        // input decoration theme (text form field)

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(AppPadding.p12),
          // hint style
          hintStyle: getRegularStyle(color: ColorManager.grey1),

          // label style
          labelStyle: getMediumStyle(color: ColorManager.darkGrey),
          // error style
          errorStyle: getRegularStyle(color: ColorManager.error),

          // enabled border
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

          // focused border
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

          // error border
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          // focused error border
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        ));
  }

  static ThemeData getDarkModeTheme() {
    return ThemeData(
        // main colors of the app
        primaryColor: ColorManager.black,
        primaryColorDark: ColorManager.white,
        disabledColor: ColorManager.grey1,
        // ripple color
        splashColor: ColorManager.primaryOpacity70,
        // Button theme
        buttonTheme: ButtonThemeData(
            shape: StadiumBorder(),
            disabledColor: ColorManager.grey1,
            buttonColor: ColorManager.primary,
            splashColor: ColorManager.primaryOpacity70),
        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: getRegularStyle(color: ColorManager.white),
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12)))),
        // Text theme
        textTheme: TextTheme(
          headlineLarge:
              getMediumStyle(color: ColorManager.white, fontSize: FontSize.s16),
          bodyLarge: getRegularStyle(
              color: ColorManager.grey1, fontSize: FontSize.s16),
          labelLarge:
              getBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
          labelMedium:
              getMediumStyle(color: ColorManager.white, fontSize: FontSize.s14),
          labelSmall: getMediumStyle(color: ColorManager.white),
        ),
        // input decoration theme (text form field)

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(AppPadding.p12),
          // hint style
          hintStyle: getRegularStyle(color: ColorManager.grey1),

          // label style
          labelStyle: getMediumStyle(color: ColorManager.white),
          // error style
          errorStyle: getRegularStyle(color: ColorManager.error),

          // enabled border
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

          // focused border
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

          // error border
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          // focused error border
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        ));
  }
}
