import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';

import '../../../../Core/Constants/asset_strings.dart';
import '../../../../Core/Constants/other_constants.dart';
import '../../../../Core/Themes/app_colors.dart';
import '../../../../Core/Widget/drawer_list_tile.dart';

class WalletAndCreditDrawer extends StatelessWidget {
  const WalletAndCreditDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: OtherConstants.appLinearGradient,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: [
                  Text(
                    "Wallet & Credit",
                    style: theme.textTheme.labelLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: RotatedBox(
                      quarterTurns: 90,
                      child: Image.asset(IconStrings.menu),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            DrawerListTile(
              iconData: Icons.account_box_outlined,
              title: 'Account Balance',
              onTap: () {
                Navigator.pop(context);
                AppNavigation.pushNamed(AppRoutes.yourAccountBalance);
              },
              icon: '',
            ),
            DrawerListTile(
              iconData: Icons.account_balance_wallet_outlined,
              title: 'Top up your Balance',
              onTap: () {
                Navigator.pop(context);
                showHomeBottomSheet(
                  context: context,
                  builder: (topUpYourBalanceCtx) => HomeBottomSheet(
                    content: [
                      Text(
                        'Top up your balance',
                        style: theme.textTheme.titleMedium,
                      ).setCenter(),
                      SizedBox(height: 10.sp),
                      Text(
                        'Select or enter an amount to recharge your balance',
                        style: theme.textTheme.bodyMedium,
                      ).setCenter(),
                      SizedBox(height: 10.sp),
                      Row(
                        children: ['100', '2500', '3000', '4000']
                            .map(
                              (item) => Expanded(
                                child: DottedBorder(
                                  radius: Radius.circular(8.sp),
                                  color: AppColors.natural100,
                                  borderType: BorderType.RRect,
                                  padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      '$item\$',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium,
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ).setCenter(),
                                ).setHorizontalPadding(context, 5.sp, enableMediaQuery: false),
                              ),
                            )
                            .toList(),
                      ),
                      Text(
                        'or',
                        style: theme.textTheme.titleMedium,
                      ).setVerticalPadding(context, 0.03).setCenter(),
                      TextFormField(
                        onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Add Your balance',
                          hintStyle: theme.textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      MainAppButton(
                        bgColor: AppColors.primary500,
                        onTap: () {
                          Navigator.pop(topUpYourBalanceCtx);
                          AppNavigation.pushNamed(AppRoutes.topUpYourBalanceScreen);
                        },
                        child: Text(
                          'Recharge Now',
                          style: theme.textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                );
              },
              icon: '',
            ),
            DrawerListTile(
              iconData: Icons.history,
              title: 'Payment History',
              onTap: () {
                Navigator.pop(context);
                AppNavigation.pushNamed(AppRoutes.paymentHistory);
              },
              icon: '',
            ),
          ],
        ),
      ),
    );
  }
}
