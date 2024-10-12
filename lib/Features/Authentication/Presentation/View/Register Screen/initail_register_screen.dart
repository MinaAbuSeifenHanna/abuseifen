import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import '../../../../../Core/Extentions/extentions.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../../../../Core/Widget/app_background.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../../../../Features/Authentication/Presentation/View/Login%20Screen/auth_screen.dart';
import '../../../../../Features/Authentication/Presentation/Widget/or_widget.dart';
import '../../../../../Features/Authentication/Presentation/Widget/register_taps.dart';

class InitilaRegisterScreen extends StatelessWidget {
  const InitilaRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(
      showTermsPolicy: true,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              const AppBackGround(),
              Column(
                children: [
                  GenralAppbar(
                    title: 'Add your email 1/2',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ).setOnlyPadding(context,.03, 0,.07, .07),
                  const RegisterTaps(index: 0),
                  const SizedBox(height: 30,),
                  const Text(
                    'Begin with creating new free account.\n This helps you keep your learning\n way easier.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ).setVerticalPadding(context, 0.10),
                  MainAppButton(
                    vertical: 0.08,
                    bgColor: AppColors.primary500,
                    child: const Text(
                      'Continue with email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).setCenter(),
                    onTap: () {
                      AppNavigation.pushNamed(AppRoutes.registerScreen);
                    },
                  ),
                  const ORWidget()
                      .setHorizontalAndVerticalPadding(context, 0.05, 0.01),
                  ...['Apple', 'Facebook', 'Google'].map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MainAppButton(
                        vertical: .08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/$e.png'),
                            const SizedBox(width: 5,),
                            Text(
                              'Continue with $e',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
