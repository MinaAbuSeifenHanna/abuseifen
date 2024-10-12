import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class ReplayField extends StatelessWidget {
  const ReplayField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.natural500,
          ),
          child: Image.asset(
            IconStrings.camera,
            width: 40,
            height: 40,
          ).setHorizontalAndVerticalPadding(context, 4, 4,enableMediaQuery: false),
        ).setHorizontalAndVerticalPadding(context, 0, 4,enableMediaQuery: false),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.natural100,
          ),
        ),
      ),
    );
  }
}
