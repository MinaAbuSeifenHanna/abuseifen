import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class MainIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? iconSize;
  final IconData icon;
  final void Function()? onTap;

  const MainIconButton({
    super.key,
    this.backgroundColor,
    this.onTap,
    this.iconSize,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(iconSize ?? 10.sp),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary500,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 15.sp,
          color: AppColors.natural100,
        ),
      ),
    );
  }
}
