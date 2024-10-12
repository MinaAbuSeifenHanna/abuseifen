import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Handler/auth_handler.dart';
import 'package:hypelify_v2/Core/Helpers/helpers.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/Home/Domain/Entities/story_info.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/story_widget.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/View/posts_view.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/Widgets/profile_image_builder.dart';

import '../../../../Core/Constants/asset_strings.dart';
import '../../../Authentication/Domain/Entities/register_data_response.dart';
import '../../../BottomNavBar/View/main_nav_bar.dart';
import '../Bloc/profile_bloc.dart';
import '../Widgets/stat_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  final List<String> tabTitles = ['Posts', 'Reels', 'Long Video'];
  int selectedIndex = 0;
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 3,
    vsync: this,
  );

  RegisterDataResponse? userData = DependencyInjectionHelper().sl<AuthHandlerInterface>().getUserData();
  late ProfileBloc profileBloc = context.read<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double coverHeight = mediaQuery.size.height * 0.15;
    var theme = Theme.of(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            print("ProfileState = $state");
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                ProfileImageBuilder(
                  screenSize: mediaQuery.size,
                  coverHeight: coverHeight,
                  profileImage: ImageStrings.profile,
                  isEdit: false,
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: ' ${userData?.name} ',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: AppColors.natural100,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => AppNavigation.pushNamed(AppRoutes.rewardScreen),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: AppColors.primary500,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_downward,
                              size: 10,
                              color: AppColors.natural100,
                            ),
                          ),
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                    ],
                  ),
                ).setCenter(),
                const SizedBox(height: 5),
                Text(
                  (state is GetProfileSuccess) ? state.registerData.bio : userData?.bio ?? '',
                  style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.secondary400),
                ).setCenter(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const StatWidget(number: '54', label: 'Posts').setHorizontalPadding(context, 0.01),
                    const StatWidget(number: '834', label: 'Followers').setHorizontalPadding(context, 0.01),
                    const StatWidget(number: '162', label: 'Following').setHorizontalPadding(context, 0.01),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: MainAppButton(
                        onTap: () => AppNavigation.pushNamed(AppRoutes.editProfile),
                        child: Text(
                          'Edit Profile',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: MainAppButton(
                        child: Text(
                          'Share Profile',
                          style: theme.textTheme.titleMedium,
                        ),
                        onTap: () => showHomeBottomSheet(
                          context: context,
                          builder: (createAdvertiserAccountsContext) => HomeBottomSheet(
                            content: [
                              Text(
                                'Advertiser Accounts',
                                style: theme.textTheme.titleMedium,
                              ).setCenter(),
                              ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.natural100),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 24,
                                    backgroundImage: AssetImage(ImageStrings.profile),
                                  ),
                                ),
                                title: Text(
                                  'Page 1',
                                  style: theme.textTheme.labelLarge,
                                ),
                                subtitle: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: AppColors.errorColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 8.sp),
                                    Text(
                                      '20 Notifications',
                                      style: theme.textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                isThreeLine: true,
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  Navigator.pop(createAdvertiserAccountsContext);
                                  AppNavigation.pushNamed(AppRoutes.advertiserAccountScreen);
                                },
                              ),
                              const Divider(),
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.natural100),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    IconStrings.NB_main,
                                    height: 27.sp,
                                    width: 27.sp,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  'Create Advertiser Account',
                                  style: theme.textTheme.labelLarge,
                                ),
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  Navigator.pop(createAdvertiserAccountsContext);
                                  AppNavigation.pushNamed(AppRoutes.createAdvertiserAccountScreen);
                                },
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).setHorizontalPadding(context, 0.1),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      StoryWidget(
                        story: StoryInfo(name: 'New', url: ''),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.natural100,
                        ),
                      ).setHorizontalPadding(context, 0.03),
                      ...[
                        StoryInfo(name: 'Friends', url: ''),
                        StoryInfo(name: 'Sport', url: ''),
                        StoryInfo(name: 'Dubai', url: ''),
                        StoryInfo(name: 'Egypt', url: '')
                      ].map(
                        (story) => StoryWidget(story: story).setHorizontalPadding(context, 0.03),
                      )
                    ],
                  ),
                ),
                const Divider(color: AppColors.natural500),
                SizedBox(
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: AppColors.primary500,
                      border: Border.all(
                        color: AppColors.natural200,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    controller: tabController,
                    tabs: tabTitles
                        .asMap()
                        .map(
                          (i, tabTitle) => MapEntry(
                            i,
                            Tab(
                              text: tabTitle,
                            ),
                          ),
                        )
                        .values
                        .toList(),
                    padding: const EdgeInsets.all(10),
                    tabAlignment: TabAlignment.fill,
                    onTap: (newIndex) {
                      profileBloc.add(UpdateTabIndex(newIndex));
                    },
                  ),
                ),
                state.currentTabIndex == 0 ? PostsView() : Container(),
                SizedBox(
                  height: MediaQuery.of(bottomNavBarKey.currentContext ?? context).viewPadding.bottom + 50,
                )
              ],
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
