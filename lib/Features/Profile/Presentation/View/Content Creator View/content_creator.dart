import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';

import '../../../../../Core/Constants/asset_strings.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../Widgets/profile_image_builder.dart';

class ContentCreatorView extends StatelessWidget {
  const ContentCreatorView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double coverHeight = mediaQuery.size.height * 0.15;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          GenralAppbar(
            title: '',
            onPressed: () => AppNavigation.pop(),
          ),
          Expanded(
              child: Column(
            children: [
              ProfileImageBuilder(
                screenSize: mediaQuery.size,
                coverHeight: coverHeight,
                profileImage: ImageStrings.profile,
                isEdit: true,
              ),
              const Text(
                'Switch to  Contact creator\n account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.natural100,
                  fontSize: 20,
                  fontFamily: 'Cairo-Bold',
                ),
              ).setVerticalPadding(context, 0.06),
              const Text(
                'With Contact creator account, you can get access to insights about your followers and account performance, new contact option and more',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.natural100,
                  fontSize: 16,
                  fontFamily: 'Cairo',
                ),
              ).setHorizontalPadding(context, 0.06),
              const Spacer(),
              MainAppButton(
                vertical: 0.08,
                horizontal: 0.02,
                bgColor: AppColors.primary500,
                child: const Text(
                  'Continue',
                ),
                onTap: () => AppNavigation.pushReplacementNamed(
                    AppRoutes.contentCreatorType),
              )
            ],
          ))
        ],
      ),
    ));
  }
}
