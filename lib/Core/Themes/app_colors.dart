import 'package:flutter/material.dart';

class AppColors {
  /// Custom colors derived from base color 0xFF6667AA.
  static const primary700 = Color(0xFF4D4E88);
  static const primary600 = Color(0xFF5A5B99);
  static const primary500 = Color(0xFF6667AA); // Base color
  static const primary400 = Color(0xFF8283BB);
  static const primary300 = Color(0xFF9999CC);
  static const primary200 = Color(0xFFB0AFDD);
  static const primary100 = Color(0xFFC7C6EE);

  /// Secondary colors.
  static const secondary600 = Color(0xFFFF5722);
  static const secondary500 = Color(0xffFF5728);
  static const secondary400 = Color(0xffFF572A);
  static const secondary300 = Color(0xffFF573A);
  static const secondary200 = Color(0xffFF573E);
  static const secondary100 = Color(0xffFF574F);

  /// Natural colors.
  static const natural700 = Color(0xff262626);
  static const natural600 = Color(0xff515151);
  static const natural500 = Color(0xff7D7D7D);
  static const natural400 = Color(0xffA8A8A8);
  static const natural300 = Color(0xffD4D4D4);
  static const natural200 = Color(0xffE9E9E9);
  static const natural100 = Color(0xffffffff);

  /// Round button border color.
  static const Color roundButtonBorderColor = primary700;

  /// Black text color.
  static const textBlack = Colors.black;

  /// Error color.
  static const errorColor = Color(0xffEB5757);

  /// Background colors.
  static const scaffoldBackgroundColor = Color(0xff011124);
  static const textFieldBackgroundColor = Color(0xffFAFAFA);

  /// Custom Material Color.
  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xFF6667AA,
    <int, Color>{
      100: primary100,
      200: primary200,
      300: primary300,
      400: primary400,
      500: primary500,
      600: primary600,
      700: primary700,
    },
  );
}
