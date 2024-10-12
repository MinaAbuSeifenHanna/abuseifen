import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/constants.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/routes.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';

import '../../../Core/Themes/app_colors.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          GenralAppbar(
            title: 'Payment Method',
            onPressed: () => AppNavigation.pop(),
          ),
          Expanded(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ).setHorizontalAndVerticalPadding(context, 0.06, 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Id Number',
                ),
              ).setHorizontalAndVerticalPadding(context, 0.06, 0.01),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(6),
                color: AppColors.natural100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconStrings.cloudUpload),
                      SizedBox(width: 15),
                      const Text(
                        'Id Image',
                        style: TextStyle(
                          color: AppColors.natural100,
                        ),
                      )
                    ],
                  ),
                ),
              ).setHorizontalAndVerticalPadding(context, 0.06, 0.04),
              MainAppButton(
                vertical: 0.05,
                horizontal: 0.02,
                bgColor: AppColors.primary500,
                child: const Text('Save'),
                onTap: () {},
              )
            ],
          ))
        ],
      ),
    ));
  }
}
