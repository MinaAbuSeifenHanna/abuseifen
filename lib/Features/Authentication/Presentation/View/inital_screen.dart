import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/constants.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/login_text.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';

import '../../../../Core/Widget/app_background.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackGround(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox().setVerticalPadding(context, .20),
              Image.asset(
                LogoStrings.mainLogo,
                fit: BoxFit.fill,
              ).setHorizontalAndVerticalPadding(
                context,
                .10,
                .0,
              ),
              const Text(
                'Step Into The Hyperverse',
                style: TextStyle(
                  color: AppColors.natural100,
                  fontFamily: 'Cairo',
                  fontSize: 24,
                ),
              ),
              const Text(
                'Connect, Create & Conquer',
                style: TextStyle(
                  color: AppColors.natural100,
                  fontFamily: 'Cairo',
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              MainAppButton(
                bgColor: AppColors.primary500,
                vertical: 0.18,
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: AppColors.natural100,
                      fontFamily: 'Cairo-Bold',
                    ),
                  ),
                ),
                onTap: () {
                  AppNavigation.pushNamed(AppRoutes.initailRegisterScreen);
                },
              ),
              LoginText(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
