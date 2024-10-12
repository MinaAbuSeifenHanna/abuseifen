import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hypelify_v2/Core/Helpers/dependency_injection_helper.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/View/reels_camera_view.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/View/selected_media_screen.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Repositories/auth_repository.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Auth%20Bloc/RegisterBloc/register_bloc.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Auth%20Bloc/auth_bloc.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/Register%20Screen/register_screen.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/Register%20Screen/success_register.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/inital_screen.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/Login%20Screen/login_screen.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/Login%20Screen/reset_email_sent_screen.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/Login%20Screen/reset_password_screen.dart';
import 'package:hypelify_v2/Features/BottomNavBar/Cubit/bottom_navigation_bar_cubit.dart';
import 'package:hypelify_v2/Features/CameraView/Presentation/Bloc/camera_bloc.dart';
import 'package:hypelify_v2/Features/CameraView/Presentation/View/camera_view.dart';
import 'package:hypelify_v2/Features/CreateAdvertiserAccount/Presentation/Bloc/create_advertiser_account_bloc.dart';
import 'package:hypelify_v2/Features/CreateAdvertiserAccount/Presentation/View/create_advertiser_account.dart';
import 'package:hypelify_v2/Features/Home/Presentation/View/home_screen.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/story_widgets/add_story.dart';
import 'package:hypelify_v2/Features/Message/Presentation/View/message_view.dart';
import 'package:hypelify_v2/Features/PaymentMethod/View/payment_method.dart';
import 'package:hypelify_v2/Features/UploadLongVideo/Presentation/View/trim_videos_screen.dart';

import '../../Features/AdDetails/Presentation/View/ad_details.dart';
import '../../Features/Advertiser/Presentation/View/advertiser_screen.dart';
import '../../Features/Advertiser/Presentation/View/payment_history_screen.dart';
import '../../Features/Advertiser/Presentation/View/topup_your_balance_screen.dart';
import '../../Features/Advertiser/Presentation/Widgets/your_account_balance.dart';
import '../../Features/Authentication/Presentation/View/Register Screen/initail_register_screen.dart';
import '../../Features/BottomNavBar/View/main_nav_bar.dart';
import '../../Features/Profile/Presentation/Bloc/profile_bloc.dart';
import '../../Features/Profile/Presentation/View/Content Creator View/content_creator.dart';
import '../../Features/Profile/Presentation/View/Content Creator View/content_creator_type.dart';
import '../../Features/Profile/Presentation/View/Edit Profile View/edit_profile_screen.dart';
import '../../Features/Profile/Presentation/View/Subscription Package/subscription_confirm.dart';
import '../../Features/Profile/Presentation/View/Subscription Package/subscription_package.dart';
import '../../Features/ReferEarn/View/refer_earn.dart';
import '../../Features/Reward/Presentation/View/reward_screen.dart';
import '../../Features/Splash/Presentation/View/splash_screen.dart';
import '../Constants/strings_constants.dart';
import 'app_navigation.dart';
import 'app_routes.dart';
import 'bloc_providers.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // var args = settings.arguments;

    //paymentMethod

    switch (settings.name) {
      case AppRoutes.splash:
        return _screenRoute(
          screen: SplashScreen(),
          settings: settings,
        );
      case AppRoutes.initial:
        return _screenRoute(
          screen: const InitialScreen(),
          settings: settings,
        );
      case AppRoutes.login:
        return _screenRoute(
          screen: BlocProvider(
            create: (context) => AuthBloc(DependencyInjectionHelper().sl<AuthRepository>()),
            child: Login(),
          ),
          settings: settings,
        );
      case AppRoutes.bottomNavBar:
        return _screenRoute(
          screen: BlocProvider(
            create: (context) => BottomNavigationBarCubit(),
            child: BottomNavBar(),
          ),
          settings: settings,
        );
      case AppRoutes.resetEmailSent:
        return _screenRoute(
          screen: const ResetEmailSent(),
          settings: settings,
        );
      case AppRoutes.home:
        return _screenRoute(
          screen: HomeScreen(),
          settings: settings,
        );
      case AppRoutes.resetPasswordScreen:
        return _screenRoute(
          screen: const ResetPassword(),
          settings: settings,
        );
      case AppRoutes.initailRegisterScreen:
        return _screenRoute(
          screen: const InitilaRegisterScreen(),
          settings: settings,
        );
      case AppRoutes.registerScreen:
        return _screenRoute(
          screen: BlocProvider(
            create: (context) => DependencyInjectionHelper().sl<RegisterBloc>(),
            child: RegisterScreen(),
          ),
          settings: settings,
        );
      case AppRoutes.successRegisterScreen:
        return _screenRoute(
          screen: const SuccessRegister(),
          settings: settings,
        );
      case AppRoutes.addStory:
        return _screenRoute(
          screen: const AddStoryView(),
          settings: settings,
        );
      case AppRoutes.rewardScreen:
        return _screenRoute(
          screen: const RewardScreen(),
          settings: settings,
        );
      case AppRoutes.referandearn:
        return _screenRoute(
          screen: ReferEarnScreen(),
          settings: settings,
        );
      case AppRoutes.paymentMethodScreen:
        return _screenRoute(
          screen: PaymentMethod(),
          settings: settings,
        );
      case AppRoutes.messageView:
        return _screenRoute(
          screen: MessageScreen(),
          settings: settings,
        );
      case AppRoutes.createAdvertiserAccountScreen:
        return _screenRoute(
          screen: BlocProvider(
            create: (context) => CreateAdvertiserAccountBloc(),
            child: CreateAdvertiserAccount(),
          ),
          settings: settings,
        );
      case AppRoutes.advertiserAccountScreen:
        return _screenRoute(
          screen: AdvertiserScreen(),
          settings: settings,
        );
      case AppRoutes.adDetails:
        return _screenRoute(
          screen: AdDetails(),
          settings: settings,
        );
      case AppRoutes.yourAccountBalance:
        return _screenRoute(
          screen: YourAccountBalance(),
          settings: settings,
        );
      case AppRoutes.paymentHistory:
        return _screenRoute(
          screen: PaymentHistory(),
          settings: settings,
        );
      case AppRoutes.topUpYourBalanceScreen:
        return _screenRoute(
          screen: TopUpYourBalanceScreen(),
          settings: settings,
        );
      case AppRoutes.addReelsScreen:
        return _screenRoute(
          screen: BlocProviders.provideAddReelsBlocWithAddReels,
          settings: settings,
        );
      case AppRoutes.reelsCameraView:
        return _screenRoute(
          screen: ReelsCameraView(),
          settings: settings,
        );
      case AppRoutes.selectedMediaScreen:
        return _screenRoute(
          screen: SelectedMediaScreen(),
          settings: settings,
        );

      case AppRoutes.editProfile:
        return _screenRoute(
          screen: BlocProvider<ProfileBloc>.value(
            value: DependencyInjectionHelper().sl<ProfileBloc>(),
            child: EditProfileScreen(
              completeProfile: settings.arguments as bool?,
            ),
          ),
          settings: settings,
        );
      case AppRoutes.contentCreator:
        return _screenRoute(
          screen: const ContentCreatorView(),
          settings: settings,
        );
      case AppRoutes.contentCreatorType:
        return _screenRoute(
          screen: const ContentCreatorType(),
          settings: settings,
        );
      case AppRoutes.subscriptionPackage:
        return _screenRoute(
          screen: const SubscriptionPackage(),
          settings: settings,
        );
      case AppRoutes.subscriptionPackageConfirm:
        return _screenRoute(
          screen: const SubscriptionConfirm(),
          settings: settings,
        );
      case AppRoutes.paymentMethod:
        return _screenRoute(
          screen: const PaymentMethod(),
          settings: settings,
        );
      case AppRoutes.addPostScreen:
        return _screenRoute(
          screen: BlocProviders.provideAddPostBlocWithAddPost,
          settings: settings,
        );
      case AppRoutes.uploadLongVideoScreen:
        return _screenRoute(
          screen: BlocProviders.provideUploadLongVideosBlocWithUploadLongVideo,
          settings: settings,
        );
      case AppRoutes.cameraView:
        return _screenRoute(
          screen: BlocProvider<CameraBloc>(
            create: (context) => DependencyInjectionHelper().sl<CameraBloc>(),
            child: const CameraView(),
          ),
          settings: settings,
        );
      case AppRoutes.trimVideosScreenOfuUploadLongVideo:
        var args = (settings.arguments as Map<String, dynamic>);
        return _screenRoute(
          screen: TrimVideosScreen(
            duration: args['duration'],
            video: args['video'],
          ),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _screenRoute({
    Widget? screen,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(builder: (context) => screen!, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              StringsConstants.appName,
            ),
          ),
          body: Center(
            child: InkWell(
              onTap: () {
                Phoenix.rebirth(AppNavigation.currentContext);
              },
              child: const Text('Try again.'),
            ),
          ),
        );
      },
    );
  }
}
