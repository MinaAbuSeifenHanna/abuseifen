// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class RegisterTaps extends StatelessWidget {
  final int index;
  const RegisterTaps({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 4,
          width: 30,
          decoration: BoxDecoration(
            color: index == 0 || index == 1
                ? AppColors.primary500
                : AppColors.natural300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          height: 4,
          width: 30,
          decoration: BoxDecoration(
            color: index == 1 ? AppColors.primary500 : AppColors.natural300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
