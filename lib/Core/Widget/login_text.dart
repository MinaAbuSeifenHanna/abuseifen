import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class LoginText extends StatelessWidget {
  final void Function()? onTap;

  const LoginText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        'Already have an account? Log in',
        style: TextStyle(
          fontFamily: 'Cairo-Bold',
          color: AppColors.natural100,
          fontSize: 16,
        ),
      ).setVerticalPadding(context, 0.04),
    );
  }
}
