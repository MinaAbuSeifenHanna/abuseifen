import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';

import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/main_app_button.dart';

class SubscriptionConfirm extends StatelessWidget {
  final bool? isMonth;
  const SubscriptionConfirm({super.key, this.isMonth});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          GenralAppbar(
            title: 'Your Subscription Packages',
            onPressed: () => AppNavigation.pop(),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manage your Subscription Packages',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                ),
              ).setHorizontalAndVerticalPadding(context, 0.06, 0.02),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                initialValue: isMonth == true ? '200 \$' : '100 \$',
                decoration: InputDecoration(
                  labelText: isMonth == true ? 'Month' : 'Annual',
                ),
                onTapOutside: (c) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ).setHorizontalPadding(context, 0.06),
              const Spacer(),
              MainAppButton(
                vertical: 0.06,
                bgColor: AppColors.primary500,
                child: const Text('Save'),
                onTap: () {
                  AppNavigation.pop();
                },
              )
            ],
          ))
        ],
      ),
    ));
  }
}
