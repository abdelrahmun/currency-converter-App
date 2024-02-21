import 'package:currency_converter/root.dart';
import 'package:currency_converter/ui/style/app_fonts.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppSettings {
  static init() {
    Root.locale = const Locale(Constants.englishLocale);
    Root.fontFamily = AppFonts.fontInter;
    Root.themeMode =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  static changeFont(Locale locale) {
    Root.fontFamily = locale.languageCode == Constants.arabicLocale ? AppFonts.fontCairo : AppFonts.fontInter;
  }
}
