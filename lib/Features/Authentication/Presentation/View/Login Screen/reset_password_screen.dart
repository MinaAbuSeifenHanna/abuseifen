import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';

import '../../../../../Core/Themes/app_colors.dart';
import 'auth_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return AuthPage(
      showTermsPolicy: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: const Text(
                  "Reset password",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                leadingWidth: 40,
                leading: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xff6667AA),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Text(
                "We will email you \na link to reset your password.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              ...[
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onTapOutside: (c) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      MainAppButton(
                        bgColor: AppColors.primary500,
                        onTap: () {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.resetEmailSent);
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
