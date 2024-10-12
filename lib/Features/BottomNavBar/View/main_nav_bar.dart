import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Helpers/dependency_injection_helper.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Features/BottomNavBar/Cubit/bottom_navigation_bar_cubit.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/Bloc/profile_bloc.dart';

import '../../../Core/Constants/asset_strings.dart';

final GlobalKey bottomNavBarKey = GlobalKey();

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    DependencyInjectionHelper().sl<ProfileBloc>()
      ..add(GetProfileEvent())
      ..stream.listen((state) {
        if (state is GetProfileSuccess) {
          if (!state.registerData.complete_profile) {
            Navigator.pushNamed(
              context,
              AppRoutes.editProfile,
              arguments: state.registerData.complete_profile,
            );
          }
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarCubit = BottomNavigationBarCubit.get(context);
    var textTheme = Theme.of(context).textTheme;
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) => Scaffold(
        key: bottomNavBarKey,
        body: bottomNavigationBarCubit.pageOptions[bottomNavigationBarCubit.index],
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: AppColors.scaffoldBackgroundColor,
          child: BottomNavigationBar(
            currentIndex: bottomNavigationBarCubit.index,
            onTap: bottomNavigationBarCubit.setIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors.scaffoldBackgroundColor,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Image(image: AssetImage(IconStrings.NB_home), width: 32, height: 32),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Image(image: AssetImage(IconStrings.NB_Ads), width: 32, height: 32),
                label: 'Search',
              ),
              const BottomNavigationBarItem(
                icon: Image(image: AssetImage(IconStrings.NB_ai_video), width: 32, height: 32),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage(ImageStrings.profile), fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.natural200, width: 2),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.natural200,
              width: 1,
            ),
          ),
          child: FloatingActionButton(
            onPressed: () {
              // Handle button press
              showHomeBottomSheet(
                context: context,
                builder: (mainBottomSheetContext) => HomeBottomSheet(
                  content: [
                    ListTile(
                      leading: Image.asset(IconStrings.videoReplay),
                      title: Text(
                        'Reel',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      horizontalTitleGap: 0,
                      onTap: () {
                        Navigator.pop(mainBottomSheetContext);
                        AppNavigation.pushNamed(AppRoutes.addReelsScreen);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: Image.asset(IconStrings.live),
                      title: Text(
                        'Live',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      horizontalTitleGap: 0,
                    ),
                    const Divider(),
                    ListTile(
                      leading: Image.asset(IconStrings.alignBoxBottomRight),
                      title: Text(
                        'Post',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      horizontalTitleGap: 0,
                      onTap: () => AppNavigation.pushNamed(AppRoutes.addPostScreen),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Image.asset(IconStrings.addStory),
                      title: Text(
                        'Story',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      horizontalTitleGap: 0,
                      onTap: () => AppNavigation.pushNamed(AppRoutes.addStory),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Image.asset(IconStrings.voice),
                      title: Text(
                        'Sound track',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      horizontalTitleGap: 0,
                    ),
                    const Divider(),
                    ListTile(
                      leading: Image.asset(IconStrings.computerVideo),
                      title: Text(
                        'Long Video',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      onTap: () => AppNavigation.pushNamed(AppRoutes.uploadLongVideoScreen),
                      horizontalTitleGap: 0,
                    ),
                    const Divider(),
                    ListTile(
                      leading: Image.asset(IconStrings.documentAttachment),
                      title: Text(
                        'Documents',
                        style: textTheme.titleMedium!.copyWith(color: AppColors.natural100),
                      ),
                      horizontalTitleGap: 0,
                    ),
                  ],
                ),
              );
            },
            tooltip: 'Create',
            backgroundColor: AppColors.primary500,
            child: const Image(
              image: AssetImage(IconStrings.NB_main),
              width: 32,
              height: 32,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
