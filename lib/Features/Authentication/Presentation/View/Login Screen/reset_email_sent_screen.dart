import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';

import '../../../../../Core/Themes/app_colors.dart';
import 'auth_screen.dart';

class ResetEmailSent extends StatelessWidget {
  const ResetEmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return AuthPage(
      showTermsPolicy: false,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We have sent an email to',
                    ),
                    TextSpan(
                      text: ' Abdelrhman@gmail.com ',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'with instructions to reset your password.',
                    ),
                  ],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              MainAppButton(
                onTap: () {
                  Navigator.pop(context);
                },
                bgColor: AppColors.primary500,
                child: const Text(
                  "Back to login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
