import 'package:flutter/material.dart';

import '../Themes/app_colors.dart';

class DrawerListTile extends StatelessWidget {
  final String icon;
  final IconData? iconData;
  final String title;
  final GestureTapCallback onTap;

  const DrawerListTile({
    super.key,
    required this.icon,
    this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: iconData != null
          ? Icon(
              iconData,
              color: Colors.white,
            )
          : Image.asset(
              icon,
              color: Colors.white,
            ),
      title: Text(
        title,
        style: textTheme.bodyLarge!.copyWith(color: AppColors.natural100),
      ),
      onTap: onTap,
    );
  }
}
