import 'package:currency_converter/data/sources/local/cache_keys.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

abstract class AppSettingsRepository {
  Future<ThemeMode> getThemeData();

  Future<Locale> getLocal();

  Future<ThemeMode> changeThemeData(ThemeMode themeMode);

  Future<Locale> changeLocalData(Locale locale);
}

class SettingsDataRepository extends AppSettingsRepository {
  @override
  Future<Locale> changeLocalData(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheKeys.spLanguageKey, locale.languageCode);
    return locale;
  }

  @override
  Future<ThemeMode> changeThemeData(ThemeMode themeMode) async {
    String theme;
    switch (themeMode) {
      case ThemeMode.light:
        theme = 'Light';
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.scaffoldBackgroundColor,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
        ));
        break;
      case ThemeMode.dark:
        theme = 'Dark';
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: AppColors.scaffoldBackgroundColor,
          systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ));
        break;
      case ThemeMode.system:
        theme = 'System';
        break;
      default:
        theme = 'System';
        break;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheKeys.spThemeKey, theme);
    return themeMode;
  }

  @override
  Future<Locale> getLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString(CacheKeys.spLanguageKey) == null) {
      sharedPreferences.setString(CacheKeys.spLanguageKey, Constants.englishLocale);
      return const Locale(Constants.englishLocale);
    }
    return Locale(sharedPreferences.getString(CacheKeys.spLanguageKey)!);
  }

  @override
  Future<ThemeMode> getThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(CacheKeys.spThemeKey)) {
      String theme = sharedPreferences.getString(CacheKeys.spThemeKey)!;
      debugPrint('Theme is: $theme');

      switch (theme) {
        case 'Light':
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.scaffoldBackgroundColor,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
          ));
          return ThemeMode.light;
        case 'Dark':
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: AppColors.scaffoldBackgroundColor,
            systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
          ));
          return ThemeMode.dark;
        case 'System':
          return ThemeMode.light;
      }
    }
    return ThemeMode.light;
  }
}
