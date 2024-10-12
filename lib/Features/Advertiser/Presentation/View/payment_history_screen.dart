import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/Advertiser/Presentation/Widgets/history_list.dart';

import '../../../../Core/Themes/app_colors.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GenralAppbar(
              title: 'Payment History',
              onPressed: () => Navigator.pop(context),
              isHaveAction: true,
              action: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary500,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ).setHorizontalPadding(context, 0.01),
            ),
            SizedBox(height: 10.sp),
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xff1C1F28),
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: AppColors.natural100,
                  ),
                  Expanded(
                    child: TextFormField(
                      onTapOutside: (c) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Search ',
                      ),
                    ),
                  )
                ],
              ).setHorizontalPadding(context, 0.03),
            ),
            SizedBox(height: 15.sp),
            const Expanded(
              child: SingleChildScrollView(
                child: HistoryList(),
              ),
            )
          ],
        ).setHorizontalPadding(context, 0.03),
      ),
    );
  }
}
