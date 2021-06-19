import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  // ThemeData get theme => redTheme;
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black87, size: 21)),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.black12,
            labelStyle: TextStyle(),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red))),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
        headline1: textThemeLight!.headline1,
        headline2: textThemeLight!.headline2,
        headline3: textThemeLight!.headline3,
        headline4: textThemeLight!.headline4,
        headline5: textThemeLight!.headline5,
        headline6: textThemeLight!.headline6,
        subtitle1: textThemeLight!.subtitle1,
        subtitle2: textThemeLight!.subtitle2,
        caption: textThemeLight!.caption,
        button: textThemeLight!.button,
        bodyText1: textThemeLight!.bodyText1,
        overline: textThemeLight!.overlinebld);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight!.cornflower_blue,
      primaryVariant: colorSchemeLight!.ebony_clay,
      secondary: Colors.white,
      secondaryVariant: colorSchemeLight!.royal_blue,
      surface: colorSchemeLight!.blue,
      background: colorSchemeLight!.athens_gray,
      error: colorSchemeLight!.singlo,
      onPrimary: colorSchemeLight!.ebony_clay,
      onSecondary: colorSchemeLight!.slate_gray,
      onSurface: colorSchemeLight!.fiord,
      onBackground: colorSchemeLight!.bali_hai,
      onError: Color(0xffffc93c),
      brightness: Brightness.light,
    );
  }
}
