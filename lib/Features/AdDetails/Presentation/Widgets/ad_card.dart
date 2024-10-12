import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Themes/app_colors.dart';

class AdCard extends StatelessWidget {
  final List<Widget> children;
  final Function()? onTap;
  const AdCard({super.key,required this.children, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(9.sp),
        margin: EdgeInsets.symmetric(vertical: 5.sp),
        decoration: BoxDecoration(
          color: AppColors.primary500.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(
            color: AppColors.primary500.withOpacity(0.2),
            width: 2.sp,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
