import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Features/Advertiser/Presentation/Widgets/credit_card_info.dart';

import '../../../../Core/Themes/app_colors.dart';
import '../../../../Core/Widget/app_appBar.dart';
import '../../../../Core/Widget/main_app_button.dart';

class TopUpYourBalanceScreen extends StatelessWidget {
  const TopUpYourBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GenralAppbar(
              title: 'Top up your balance',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fill your Card Inforamtion',
                        style: theme.headlineSmall,
                      ),
                      SizedBox(height: 24.sp),
                      const CreditCardInfo(),
                      SizedBox(height: 30.sp),
                      MainAppButton(
                        bgColor: AppColors.primary500,
                        onTap: () {},
                        child: Text(
                          'Recharge Now',
                          style: theme.titleMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ).setHorizontalPadding(context, 0.03),
      ),
    );
  }
}
