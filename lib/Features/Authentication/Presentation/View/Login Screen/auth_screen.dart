import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Widget/app_background.dart';

class AuthPage extends StatelessWidget {
  final Widget child;
  final bool showTermsPolicy;

  const AuthPage({
    super.key,
    required this.child,
    this.showTermsPolicy = false,
  });

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          const AppBackGround(),
          Column(
            children: [
              Expanded(child: child),
              if (showTermsPolicy && !isKeyboardOpen)
                const SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Terms and .
                      Text(
                        'By using HYPERVERSE, you agree to the',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Terms',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
