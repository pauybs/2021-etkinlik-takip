import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color blue = Color(0xff4522FF);
  final Color holly = Color(0xff00160A);
  final Color white = Color(0xffffffff);
  final Color cornflower_blue = Color(0xff5B60FD);
  final Color slate_gray = Color(0xff758296);
  final Color athens_gray = Color(0xffF7F8FA);
  final Color royal_blue = Color(0xff464CE1);
  final Color ebony_clay = Color(0xff262E36);
  final Color fiord = Color(0xff3F4A61);
  final Color singlo = Color(0xffE56B6F);
  final Color gray = Color(0xffa5a6ae);
  final Color lightGray = Color(0xffF6F7F9);
  final Color darkGray = Color(0xff676870);
  final Color black = Color(0xff020306);
  final Color bali_hai = Color(0xffFA4A0C);

  final Color azure = Color(0xff27928d);
}
