import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Features/Advertiser/Presentation/Widgets/history_list.dart';

import '../../../../Core/Constants/other_constants.dart';
import '../../../../Core/Widget/app_appBar.dart';

class YourAccountBalance extends StatelessWidget {
  const YourAccountBalance({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context);
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GenralAppbar(
              title: 'Your Account balance',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'You Balance',
                      style: theme.headlineSmall,
                    ).setCenter(),
                    Text(
                      '\$37,567.00',
                      style: theme.headlineLarge,
                    ).setCenter(),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      margin: EdgeInsets.only(bottom: 10.sp),
                      decoration: BoxDecoration(
                          gradient: OtherConstants.appLinearGradient,
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(color: AppColors.natural500)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total End Campaign',
                                style: theme.titleMedium,
                              ),
                              const Spacer(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '3302.07',
                                    style: theme.titleMedium,
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.green,
                                    size: 15,
                                  )
                                ],
                              )
                            ],
                          ).setVerticalPadding(context, 0.03),
                          Row(
                            children: [
                              Text(
                                'First Campaign',
                                style: theme.titleMedium,
                              ),
                              const Spacer(),
                              Text(
                                '04-09-2023',
                                style: theme.titleMedium,
                              ),
                            ],
                          ).setVerticalPadding(context, 0.03),
                          Row(
                            children: [
                              Text(
                                'Last Campaign',
                                style: theme.titleMedium,
                              ),
                              const Spacer(),
                              Text(
                                '07-16-2024',
                                style: theme.titleMedium,
                              ),
                            ],
                          ).setVerticalPadding(context, 0.03),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        IconStrings.history,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward, size: 30.sp),
                        color: AppColors.natural100,
                        onPressed: () => AppNavigation.pushNamed(
                          AppRoutes.paymentHistory,
                        ),
                      ),
                      title: Text(
                        'Payment Histoy',
                        style: theme.titleMedium,
                      ),
                    ),
                    const HistoryList(),
                  ],
                ),
              ),
            )
          ],
        ).setHorizontalPadding(context, 0.03),
      ),
    );
  }
}
