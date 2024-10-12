import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/Advertiser/Presentation/Widgets/wallet&credit_drawer.dart';

import '../../../../Core/Themes/app_colors.dart';
import '../../../AdDetails/Presentation/Widgets/ad_card.dart';

class AdvertiserScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AdvertiserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                image: const ExactAssetImage(ImageStrings.profileCover),
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
                height: size.padding.top + 70.sp,
                width: double.infinity,
              ),
              GenralAppbar(
                title: 'Page 1',
                onPressed: () {
                  Navigator.pop(context);
                },
                isHaveAction: true,
                action: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
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
                    Container(
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
                        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ).setHorizontalPadding(context, 0.01),
                  ],
                ),
              ).setHorizontalPadding(context, 0.03),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Image.asset(
                      IconStrings.ads,
                    ),
                    SizedBox(width: 6.sp),
                    Text(
                      'On Going Ads',
                      style: theme.labelLarge,
                    )
                  ],
                ),
                SizedBox(height: 10.sp),
                ...List<String>.filled(4, '').map(
                  (e) => GestureDetector(
                    onTap: () => AppNavigation.pushNamed(AppRoutes.adDetails),
                    child: AdCard(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              size: 20,
                              color: AppColors.natural100,
                            ),
                            SizedBox(width: 6.sp),
                            Text(
                              '11-jul-2024',
                              style: theme.bodySmall,
                            )
                          ],
                        ),
                        SizedBox(height: 10.sp),
                        Image.asset(
                          ImageStrings.postImage,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 3.sp),
                        Text(
                          'joshua_l The game in Japan was amazing and I want to share some photos',
                          style: theme.labelMedium,
                        ),
                        SizedBox(height: 7.sp),
                        Text(
                          'joshua_l The game in Japan ',
                          style: theme.bodySmall,
                        ),
                        SizedBox(height: 7.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: ['SHARES (20)', 'VIEWS (20)', 'LEADS (20)', 'CTR (71.4%)']
                              .map(
                                (e) => Text(
                                  e,
                                  style: theme.titleSmall,
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ).setHorizontalPadding(context, 0.03),
          ),
        ],
      ),
      drawer: WalletAndCreditDrawer(),
    );
  }
}
