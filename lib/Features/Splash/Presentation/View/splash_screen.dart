import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Helpers/dependency_injection_helper.dart';
import 'package:hypelify_v2/Core/Widget/app_background.dart';

import '../../../../Core/Constants/asset_strings.dart';
import '../../../../Core/Handler/auth_handler.dart';
import '../../../../Core/Routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () async {
      AuthHandlerInterface authHandler = await DependencyInjectionHelper().sl<AuthHandlerInterface>().init();
      String? token = authHandler.getToken();
      if (mounted) {
        if (token != null) {
          Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBar);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.initial);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const AppBackGround(),
        Center(
          child: FadeInDownBig(
            duration: const Duration(milliseconds: 650),
            curve: Curves.easeInOutCubicEmphasized,
            child: Image.asset(
              LogoStrings.mainLogo,
            ),
          ),
        ),
      ],
    ));
  }
}
