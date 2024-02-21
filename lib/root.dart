import 'package:currency_converter/bloc/app_settings/bloc.dart';
import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/data/repositories/app_settings_repositoy.dart';
import 'package:currency_converter/data/sources/local/cache_helper.dart';
import 'package:currency_converter/data/sources/local/cache_keys.dart';
import 'package:currency_converter/data/sources/local/isar_local.dart';
import 'package:currency_converter/ui/style/app_themes.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:currency_converter/utils/app_settings.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/utils/router/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


/// This widget is the root of your application.
class Root extends StatefulWidget {
  const Root({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();
  static late String fontFamily;
  static late Locale locale;
  static late ThemeMode themeMode;

  static bool isGuest() => CacheHelper.get(CacheKeys.spToken) == null;

  static isArabicLocale() => locale.languageCode == 'ar';

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late AppSettingsBloc settingsBloc;

  @override
  void initState() {
    AppSettings.init();

    settingsBloc = AppSettingsBloc(SettingsDataRepository())..add(LoadSettings());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(create: (BuildContext context) => settingsBloc),
      ],
      child: BlocListener<AppSettingsBloc, AppSettingsState>(
        listener: (context, state) {
          if (state is SettingsLoadedState) {
            setState(() {
              Root.locale = state.locale;
            });
          } else if (state is LocalLoadedState) {
            setState(() {
              Root.locale = state.locale;
            });
          } else if (state is ThemeModeLoadedState) {
            setState(() {
              Root.themeMode = state.themeMode;
            });
          }
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return MaterialApp(
              navigatorKey: Root.navigatorKey,
              title: Constants.appName,
              debugShowCheckedModeBanner: false,

              /// Theme
              themeMode: ThemeMode.light,
              theme: AppThemes(Root.fontFamily).lightModeTheme,
              darkTheme: AppThemes(Root.fontFamily).darkModeTheme,

              /// Locale & Localization
              supportedLocales: [Constants.englishLocale, Constants.arabicLocale].map<Locale>((language) => Locale(language)),
              locale: Root.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },

              /// Route settings
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
