import 'package:currency_converter/root.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData of(BuildContext context) => Theme.of(context);

  String fontFamily;

  AppThemes(this.fontFamily);

  ThemeData lightModeTheme = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: const Color(0xFF1375BE),
      canvasColor: const Color(0xFFFFFFFF),
      cardColor: Colors.white,
      splashColor: const Color(0xff8c8c8c),
      scaffoldBackgroundColor: const Color(0xffFAFAFA),
      textTheme: AppThemes.lightTextTheme,
      fontFamily: Root.fontFamily,
      colorScheme: ColorScheme(
        primary: const Color(0xFF0864bf),
        secondary: const Color(0xFFE4E4E4),
        scrim: const Color(0xFF5ABDF2),
        tertiary: const Color(0xFFAAAAAA),
        onTertiary: const Color(0xFF888888),
        shadow: const Color(0xFF00001A),
        surface: Colors.white,
        outline: const Color(0xFF00AC77),
        background: const Color(0xffFDFDFD),
        error: Colors.red,
        onPrimary: const Color(0xFF222222),
        onSecondary: Colors.white,
        onSurface: const Color(0xFF3B3B3B),
        onBackground: Colors.grey[300]!,
        onError: Colors.grey[100]!,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      )));

  ThemeData darkModeTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1375BE),
    primaryColorDark: Colors.white,
    canvasColor: const Color(0xFF000000),
    cardColor: const Color(0xFF383838),
    splashColor: const Color(0xFF282828),
    scaffoldBackgroundColor: const Color(0xffFDFDFD),
    disabledColor: const Color(0xffEFEFEF),
    textTheme: AppThemes.darkTextTheme,
    fontFamily: Root.fontFamily,
    colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark)
        .copyWith(secondary: const Color(0xFFE4E4E4))
        .copyWith(background: const Color(0xFF1375BE)),
  );

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: displayLarge.copyWith(color: Colors.white),
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineMedium: headline4.copyWith(color: AppColors.lightGrey),
    headlineSmall: headline5.copyWith(color: Colors.white),
    titleLarge: headline6.copyWith(color: Colors.white),
    labelLarge: button.copyWith(color: Colors.white),
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    titleMedium: TextStyle(
      height: 1.4,
      color: AppColors.lightGrey,
      fontFamily: Root.fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: displayLarge.copyWith(color: Colors.black),
    displayMedium: displayMedium.copyWith(color: Colors.white),
    displaySmall: displaySmall.copyWith(color: Colors.white),
    headlineMedium: headline4.copyWith(color: AppColors.lightGrey),
    headlineSmall: headline5.copyWith(color: AppColors.lightGrey),
    titleLarge: headline6.copyWith(color: Colors.black),
    labelLarge: button.copyWith(color: Colors.black),
    bodyLarge: bodyLarge.copyWith(color: Colors.white),
    bodyMedium: bodyMedium.copyWith(color: Colors.white),
    bodySmall: bodySmall.copyWith(color: Colors.white),
    titleMedium: TextStyle(
        height: 1.4,
        color: AppColors.lightGrey,
        fontFamily: Root.fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12),
  );

  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(height: 1.4, color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 20),
    displayMedium: TextStyle(height: 1.4, color: AppColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 14),
    displaySmall: TextStyle(height: 1.4, color: AppColors.primaryColor, fontWeight: FontWeight.w400, fontSize: 14),
    headlineMedium: TextStyle(height: 1.4, color: AppColors.primaryColor, fontWeight: FontWeight.w400, fontSize: 14),
    headlineSmall: TextStyle(height: 1.4, color: AppColors.primaryColor, fontWeight: FontWeight.w400, fontSize: 12),
    titleLarge: const TextStyle(height: 1.4, color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
    labelLarge: const TextStyle(height: 1.4, color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
    bodySmall: TextStyle(height: 1.4, color: AppColors.lightGrey, fontWeight: FontWeight.w400, fontSize: 13),
    titleMedium: TextStyle(height: 1.4, color: AppColors.lightGrey, fontWeight: FontWeight.w400, fontSize: 10),
    titleSmall: TextStyle(height: 1.4, color: AppColors.lightGrey, fontWeight: FontWeight.w400, fontSize: 9),
  );

  static TextStyle displayLarge = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
    fontSize: 18,
  );

  static TextStyle displayMedium = const TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 20,
  );

  static TextStyle displaySmall = const TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 14,
  );

  static TextStyle bodyLarge = const TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16,
  );

  static TextStyle bodyMedium = const TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 14,
  );

  static TextStyle bodySmall = const TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 12,
  );

  static TextStyle headline4 = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    fontSize: 14,
  );

  static TextStyle headline5 = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
    fontSize: 20,
  );

  static TextStyle headline6 = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
    fontSize: 14,
  );

  static TextStyle button = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 16,
  );

  static TextStyle input = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 14,
  );

  static TextStyle smallText = TextStyle(
    height: 1.4,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 10,
  );

  static double arabicFontExtraPixels = 40;

  static landingTextStyle(context, {bool isBold = false}) => TextStyle(
        height: 1.4,
        fontSize: isBold ? 26 : 24,
        color: Theme.of(context).canvasColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      );
}

extension CustomThemeData on ThemeData {
  Color get customLabelColor => brightness == Brightness.light ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  Color get customBlackColor => brightness == Brightness.light ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  Color get customWhiteColor => brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

  Color get customRedColor => const Color(0xFFFE346E);
}
