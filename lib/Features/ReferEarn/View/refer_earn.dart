import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';

import '../../../Core/Helpers/methods.dart';

class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({super.key});

  final String url = 'http://www.zotware.com';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GenralAppbar(
                title: 'Refer and Earn',
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 30.sp),
              Image.asset(ImageStrings.refer_earn),
              SizedBox(height: 30.sp),
              Text(
                'Share the code with your friends to enter at registration. The more you invite the more money you get',
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.sp),
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.natural300,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      url,
                      style: theme.textTheme.titleMedium,
                    ),
                    IconButton(
                      onPressed: () => copyToClipboard(context, text: url),
                      icon: Image.asset(IconStrings.copy),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
              MainAppButton(
                bgColor: AppColors.primary500,
                child: const Text('Share Code'),
                onTap: () {
                  AppNavigation.pushNamed(AppRoutes.paymentMethodScreen);
                },
              ),
              SizedBox(height: 20.sp),
              Container(
                padding: EdgeInsets.all(9.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary500.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(
                    color: AppColors.primary500.withOpacity(0.2),
                    width: 2.sp,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You earnings',
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          '0',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ).setOnlyPadding(context, 0, 0.02, 0, 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Invitations Left',
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          '0',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ).setHorizontalPadding(context, 0.05),
        ),
      ),
    );
  }
}
