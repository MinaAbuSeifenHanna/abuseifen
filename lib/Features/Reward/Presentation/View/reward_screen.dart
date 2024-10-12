import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Core/Widget/main_icon_button.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';

import '../../../../Core/Themes/app_colors.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  MainIconButton(
                    icon: Icons.share,
                    onTap: () {
                      AppNavigation.pushNamed(AppRoutes.referandearn);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                "Abdelrhman Adel\nBalance",
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Stack(
                children: [
                  Image.asset(
                    ImageStrings.balanceCard,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 0,
                    right: 10.sp,
                    left: 10.sp,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Balance ',
                                style: theme.textTheme.titleLarge,
                                children: [
                                  WidgetSpan(
                                    child: Image.asset(IconStrings.dollar),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '0 USD',
                              style: theme.textTheme.titleLarge,
                            )
                          ],
                        ),
                        Image.asset(IconStrings.balance_logo)
                      ],
                    ).setOnlyPadding(context, 10.sp, 0, 0, 0, enableMediaQuery: false),
                  ),
                  PositionedDirectional(
                    end: 10.sp,
                    bottom: 10.sp,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: MainIconButton(
                              icon: Icons.add,
                              iconSize: 3.sp,
                              onTap: () {
                                showHomeBottomSheet(
                                  context: context,
                                  builder: (balanceTransferCtx) => HomeBottomSheet(
                                    content: [
                                      Text(
                                        'Balance Transfer',
                                        style: theme.textTheme.titleMedium,
                                      ).setCenter(),
                                      TextFormField(
                                        onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                                        decoration: const InputDecoration(
                                          labelText: 'The Amount Requird',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Paypal',
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          const Spacer(),
                                          Radio(
                                            value: true,
                                            groupValue: true,
                                            onChanged: (v) {},
                                            overlayColor: const WidgetStatePropertyAll(AppColors.natural100),
                                            fillColor: const WidgetStatePropertyAll(AppColors.natural100),
                                          ),
                                        ],
                                      ).setOnlyPadding(context, 0.03, 0, 0, 0),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            'Bank Transfer',
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          const Spacer(),
                                          Radio(
                                            value: true,
                                            groupValue: false,
                                            onChanged: (v) {},
                                            overlayColor: const WidgetStatePropertyAll(AppColors.natural100),
                                            fillColor: const WidgetStatePropertyAll(AppColors.natural100),
                                          ),
                                        ],
                                      ).setOnlyPadding(context, 0.03, 0, 0, 0),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            'Stc Pay',
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          const Spacer(),
                                          Radio(
                                            value: true,
                                            groupValue: false,
                                            onChanged: (v) {},
                                            overlayColor: const WidgetStatePropertyAll(AppColors.natural100),
                                            fillColor: const WidgetStatePropertyAll(AppColors.natural100),
                                          ),
                                        ],
                                      ).setOnlyPadding(context, 0.03, 0, 0, 0),
                                      SizedBox(height: 10.sp),
                                      MainAppButton(
                                        bgColor: AppColors.primary500,
                                        child: Text(
                                          'Submit',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text: ' Balance Transfer ',
                            style: theme.textTheme.titleSmall,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.sp),
              Text(
                'Previous transfer',
                style: theme.textTheme.titleLarge,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gif(
                      image: const AssetImage(ImageStrings.no_data_found),
                      autostart: Autostart.loop,
                      width: size.width * 0.3,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'No result Found',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ).setCenter(),
              ),
            ],
          ).setHorizontalPadding(context, 0.05),
        ),
      ),
    );
  }
}
