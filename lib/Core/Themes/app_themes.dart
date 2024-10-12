import '../../Core/Constants/strings_constants.dart';
import '../../Core/Themes/Styles/app_bar_theme_styles.dart';
import '../../Core/Themes/Styles/button_theme_styles.dart';
import '../../Core/Themes/Styles/dialog_theme_styles.dart';
import '../../Core/Themes/Styles/snackbar_theme_styles.dart';
import '../../Core/Themes/Styles/text_theme_styles.dart';
import '../../Core/Themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // CONFIG - DARK THEME
  static final darkTheme = ThemeData(
    // bool? applyElevationOverlayColor,
    // NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
    // Iterable<ThemeExtension<dynamic>>? extensions,
    // inputDecorationTheme: InputDecorationThemeStyles.inputDecorationTheme,
    // MaterialTapTargetSize? materialTapTargetSize,
    // PageTransitionsTheme? pageTransitionsTheme,
    // TargetPlatform? platform,
    // ScrollbarThemeData? scrollbarTheme,
    // InteractiveInkFeatureFactory? splashFactory,
    useMaterial3: false,
    // VisualDensity? visualDensity,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary700,
      onPrimary: AppColors.primary400,
      // Color? primaryContainer,
      // Color? onPrimaryContainer,
      secondary: AppColors.secondary600,
      onSecondary: AppColors.secondary400,
      // Color? secondaryContainer,
      // Color? onSecondaryContainer,
      // Color? tertiary,
      // Color? onTertiary,
      // Color? tertiaryContainer,
      // Color? onTertiaryContainer,
      error: AppColors.errorColor,
      onError: AppColors.errorColor,
      surface: AppColors.scaffoldBackgroundColor,
      onSurface: AppColors.primaryMaterialColor,
    ),
    // Color? colorSchemeSeed,
    // Color? dialogBackgroundColor,
    disabledColor: Colors.yellow,
    dividerColor: AppColors.natural200,
    focusColor: Colors.deepPurpleAccent,
    // highlightColor: Colors.pink[200],
    hintColor: AppColors.natural700,
    hoverColor: Colors.red,
    indicatorColor: AppColors.primary700,
    // Color? primaryColor,
    // Color? primaryColorDark,
    // Color? primaryColorLight,
    // MaterialColor? primarySwatch,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    // fontFamily: AppConstants.fontFamily,
    // List<String>? fontFamilyFallback,
    // String? package,
    // IconThemeData? iconTheme,
    // IconThemeData? primaryIconTheme,
    // TextTheme? primaryTextTheme,
    textTheme: TextTheme(
      displayLarge:
          TextThemeStyles.displayLarge.copyWith(color: AppColors.natural100),
      displayMedium:
          TextThemeStyles.displayMedium.copyWith(color: AppColors.natural100),
      displaySmall:
          TextThemeStyles.displaySmall.copyWith(color: AppColors.natural300),
      headlineLarge:
          TextThemeStyles.headlineLarge.copyWith(color: AppColors.natural100),
      headlineMedium:
          TextThemeStyles.headlineMedium.copyWith(color: AppColors.natural100),
      headlineSmall:
          TextThemeStyles.headlineSmall.copyWith(color: AppColors.natural300),
      titleLarge:
          TextThemeStyles.titleLarge.copyWith(color: AppColors.natural100),
      titleMedium:
          TextThemeStyles.titleMedium.copyWith(color: AppColors.natural100),
      titleSmall:
          TextThemeStyles.titleSmall.copyWith(color: AppColors.natural300),
      bodyLarge:
          TextThemeStyles.bodyText18.copyWith(color: AppColors.natural100),
      bodyMedium: TextThemeStyles.bodyText14,
      bodySmall: TextThemeStyles.bodyText12,
      labelLarge: TextThemeStyles.labelLarge,
      labelMedium: TextThemeStyles.labelMedium,
      labelSmall:
          TextThemeStyles.labelSmall.copyWith(color: AppColors.natural300),
    ),
    // Typography? typography,
    appBarTheme: AppBarThemeStyles.appBarTheme,
    // BadgeThemeData? badgeTheme,
    // MaterialBannerThemeData? bannerTheme,
    // BottomAppBarTheme? bottomAppBarTheme,
    // BottomNavigationBarThemeData? bottomNavigationBarTheme,
    // BottomSheetThemeData? bottomSheetTheme,
    // ButtonBarThemeData? buttonBarTheme,
    // ButtonThemeData? buttonTheme,
    // CardTheme? cardTheme,
    // CheckboxThemeData? checkboxTheme,
    // ChipThemeData? chipTheme,
    // DataTableThemeData? dataTableTheme,
    dialogTheme: DialogThemeStyles.dialogTheme,
    // DividerThemeData? dividerTheme,
    // DrawerThemeData? drawerTheme,
    // DropdownMenuThemeData? dropdownMenuTheme,
    elevatedButtonTheme: ButtonThemeStyles.elevatedButtonTheme,
    // ExpansionTileThemeData? expansionTileTheme,
    // FilledButtonThemeData? filledButtonTheme,
    floatingActionButtonTheme: ButtonThemeStyles.floatingActionButtonTheme,
    // IconButtonThemeData? iconButtonTheme,
    // ListTileThemeData? listTileTheme,
    // MenuBarThemeData? menuBarTheme,
    // MenuButtonThemeData? menuButtonTheme,
    // MenuThemeData? menuTheme,
    // NavigationBarThemeData? navigationBarTheme,
    // NavigationDrawerThemeData? navigationDrawerTheme,
    // NavigationRailThemeData? navigationRailTheme,
    outlinedButtonTheme: ButtonThemeStyles.outlinedButtonTheme,
    // PopupMenuThemeData? popupMenuTheme,
    // ProgressIndicatorThemeData? progressIndicatorTheme,
    // RadioThemeData? radioTheme,
    // SegmentedButtonThemeData? segmentedButtonTheme,
    // SliderThemeData? sliderTheme,
    // SnackBarThemeData? snackBarTheme,
    snackBarTheme: SnackbarThemeStyles.snackBarThemeData,
    // SwitchThemeData? switchTheme,
    // TabBarTheme? tabBarTheme,
    textButtonTheme: ButtonThemeStyles.textButtonTheme,
    // TextSelectionThemeData? textSelectionTheme,
    // TimePickerThemeData? timePickerTheme,
    // ToggleButtonsThemeData? toggleButtonsTheme,
    // TooltipThemeData? tooltipTheme,
    /// Input Decoration Theme
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: AppColors.secondary600,
      suffixIconColor: AppColors.secondary600,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      hintStyle: TextStyle(
        fontFamily: StringsConstants.fontFamily,
        fontSize: 14.0,
        color: AppColors.natural300,
      ),
      labelStyle: TextStyle(
        fontFamily: StringsConstants.fontFamily,
        fontSize: 14.0,
        color: AppColors.natural300,
      ),
      errorStyle: TextStyle(
        fontFamily: StringsConstants.fontFamily,
        fontSize: 14.0,
      ),
      enabledBorder: UnderlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: AppColors.natural500,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: AppColors.errorColor,
        ),
      ),
      border: UnderlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: AppColors.natural100,
        ),
      ),
    ),
  );

  // CONFIG - LIGHT THEME
  static final lightTheme = ThemeData();
}
