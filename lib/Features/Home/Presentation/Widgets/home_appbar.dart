import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';

import '../../../../Core/Routes/routes.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: mediaQuery.size.width,
      height: mediaQuery.padding.top + mediaQuery.size.height * 0.08,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Image.asset(IconStrings.menu),
                  padding: EdgeInsets.zero,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(IconStrings.bell),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () => AppNavigation.pushNamed(AppRoutes.messageView),
                    icon: Image.asset(IconStrings.messages),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            LogoStrings.mainLogo,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
