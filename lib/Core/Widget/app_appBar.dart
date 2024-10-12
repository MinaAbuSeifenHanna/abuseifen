// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class GenralAppbar extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool? isHaveAction;
  final Widget? action;
  final bool xIconNotBack;

  const GenralAppbar({
    super.key,
    required this.title,
    required this.onPressed,
    this.isHaveAction = false,
    this.xIconNotBack = false,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
      leadingWidth: 40,
      leading: DecoratedBox(
        decoration: BoxDecoration(
            color: xIconNotBack ? AppColors.natural600.withOpacity(0.8) : AppColors.primary500,
            shape: BoxShape.circle,
            border: xIconNotBack
                ? null
                : Border.all(
                    color: Colors.white,
                  )),
        child: IconButton(
          onPressed: onPressed,
          padding: const EdgeInsets.all(0),
          icon: Icon(
            xIconNotBack ? Icons.close : Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ).setHorizontalPadding(context, 0.01),
      actions: [
        action ?? const SizedBox(),
      ],
    );
  }
}
