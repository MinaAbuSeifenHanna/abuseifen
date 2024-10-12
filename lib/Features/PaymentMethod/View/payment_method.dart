import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Constants/asset_strings.dart';
import '../../../../Core/Extentions/extentions.dart';
import '../../../../Core/Routes/app_navigation.dart';
import '../../../../Core/Routes/app_routes.dart';
import '../../../../Core/Themes/app_colors.dart';
import '../../../../Core/Widget/app_appBar.dart';
import '../../../../Core/Widget/main_app_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GenralAppbar(
                title: 'Payment Method',
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 30.sp),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'id Number',
                ),
              ),
              SizedBox(height: 10.sp),
              DottedBorder(
                padding: EdgeInsets.symmetric(vertical: 14.sp),
                borderType: BorderType.RRect,
                radius: Radius.circular(4.sp),
                color: AppColors.natural100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconStrings.upload),
                    SizedBox(width: 5.sp),
                    Text(
                      'Id Image',
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
              MainAppButton(
                bgColor: AppColors.primary500,
                onTap: () => AppNavigation.pushNamed(AppRoutes.messageView),
                child: const Text('Save'),
              )
            ],
          ).setHorizontalPadding(context, 0.05),
        ),
      ),
    );
  }
}
