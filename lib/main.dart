import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/Constants/constants.dart';
import '../../../Core/Helpers/dependency_injection_helper.dart';
import '../../../Core/Routes/app_navigation.dart';
import 'Core/Routes/route_generator.dart';
import 'Core/Themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await DependencyInjectionHelper().init();
  // await DependencyInjectionHelper().sl<AuthHandlerInterface>().init();
  //configLoading();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: Phoenix(child: const MyApp()),
    ),
  );
}

/*void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 60
    ..textColor = Colors.black
    ..radius = 20
    ..backgroundColor = Colors.transparent
    ..maskColor = Colors.white
    ..indicatorColor = Colors.black54
    ..userInteractions = false
    ..dismissOnTap = false
    ..boxShadow = <BoxShadow>[]
    ..indicatorWidget = const CircularProgressIndicator(
      color: Colors.black,
    );
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 844),
      builder: (_, __) => MaterialApp(
        title: StringsConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.dark,
        navigatorKey: AppNavigation.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: EasyLoading.init(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: child ?? const Scaffold(),
          ),
        ),
      ),
    );
  }
}
