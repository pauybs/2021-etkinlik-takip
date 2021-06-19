import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    if (_instace == null) _instace = TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle headline1 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 =
      TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 =
      TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final TextStyle headline4 =
      TextStyle(fontSize: 26, fontWeight: FontWeight.w700, letterSpacing: 0.25);
  final TextStyle headline5 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  final TextStyle headline6 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  final TextStyle subtitle1 =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
  final TextStyle subtitle2 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle bodyText1 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  final TextStyle button = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  final TextStyle caption =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  final TextStyle overlinemd =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w600);

  final TextStyle overlinebld =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w700);
}
