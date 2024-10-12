import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Routes/routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

import '../../../../Core/Constants/constants.dart';
import '../../../../Core/Widget/drawer_list_tile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

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
            UserAccountsDrawerHeader(
              accountName: Text(
                "Abdelrhman Adel",
                style: theme.textTheme.labelLarge,
              ),
              accountEmail: Text(
                "UX/UI Designer",
                style: theme.textTheme.titleMedium!.copyWith(color: AppColors.natural500),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(ImageStrings.profile),
              ),
              decoration: const BoxDecoration(color: Colors.transparent),
              // Transparent header background
              otherAccountsPictures: [
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
            DrawerListTile(
              icon: IconStrings.profile_drawer_icon,
              title: 'Profile',
              onTap: () {},
            ),
            DrawerListTile(
              icon: IconStrings.inbox,
              title: 'Inbox',
              onTap: () {
                AppNavigation.pop();
                AppNavigation.pushNamed(AppRoutes.messageView);
              },
            ),
            DrawerListTile(
              icon: IconStrings.rewards,
              title: 'Rewards',
              onTap: () {
                AppNavigation.pop();
                AppNavigation.pushNamed(AppRoutes.rewardScreen);
              },
            ),
            DrawerListTile(
              icon: IconStrings.refer_earn,
              title: 'Refer and Earn',
              onTap: () {
                AppNavigation.pop();
                AppNavigation.pushNamed(AppRoutes.referandearn);
              },
            ),
            DrawerListTile(
              icon: IconStrings.payment_method,
              title: 'Payment Method',
              onTap: () {
                AppNavigation.pop();
                AppNavigation.pushNamed(AppRoutes.paymentMethod);
              },
            ),
            DrawerListTile(
              icon: IconStrings.recent_activity,
              title: 'Recent Activity',
              onTap: () {},
            ),
            DrawerListTile(
              icon: IconStrings.help,
              title: 'Help',
              onTap: () {},
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 59, 48, 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Image.asset(IconStrings.logout, color: Colors.red),
                title: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // Handle logout
                  AppNavigation.popUntil(
                    ModalRoute.withName(AppRoutes.initial),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
