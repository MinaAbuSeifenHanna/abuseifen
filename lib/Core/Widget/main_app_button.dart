// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';

import '../Themes/app_colors.dart';

class MainAppButton extends StatelessWidget {
  final Color? bgColor;
  final double? vertical;
  final double? horizontal;
  final Widget child;
  final Function()? onTap;
  final double ? width ;
  final double ? height ;
  const MainAppButton({
    super.key,
    this.bgColor,
    this.vertical,
    this.horizontal,
    this.onTap,
    required this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 343, // ,
        height: height  ?? 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
              color: AppColors.natural100,
              width: 0.5,
            )),
        child: child,
      ).setHorizontalAndVerticalPadding(
        context,
        vertical ?? 0.0,
        horizontal ?? 0.0,
      ),
    );
  }
}
