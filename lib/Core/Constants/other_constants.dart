import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class OtherConstants {
  static const List<double> stopsGradient = [0.0, 0.115, 0.214, 0.33, 0.434, 0.625, 0.735, 0.855, 1.0];
  static const List<Color> colorsGradient = [
    Color(0xFF010836),
    Color(0xFF080E37),
    Color(0xFF0E1337),
    Color(0xFF151938),
    Color(0xFF1B1F39),
    Color(0xFF26293A),
    Color(0xFF2D2F3B),
    Color(0xFF34353C),
    Color(0xFF3D3D3D),
  ];
  static const Gradient appLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: colorsGradient,
    stops: stopsGradient,
  );
  static const Gradient liveLinearGradient = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [
      Color(0xffC5008D),
      Color(0xffE20037),
    ],
    stops: [0,1],
  );
  static  Gradient liveCommentsLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
    colors: [
      AppColors.natural500.withOpacity(0.1),
      Colors.transparent,
    ],
    stops: [0,1],
  );
}
