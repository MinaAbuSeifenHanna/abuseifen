import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/View/Subscription%20Package/subscription_confirm.dart';

class SubscriptionPackage extends StatelessWidget {
  const SubscriptionPackage({super.key});

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
              MainAppButton(
                vertical: 0.06,
                horizontal: 0.03,
                bgColor: AppColors.primary500,
                child: const Text('Monthly'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const SubscriptionConfirm(isMonth: true),
                    ),
                  );
                },
              ),
              MainAppButton(
                vertical: 0.06,
                bgColor: AppColors.primary500,
                child: const Text('Annual'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const SubscriptionConfirm(isMonth: false),
                    ),
                  );
                },
              )
            ],
          ))
        ],
      ),
    ));
  }
}
