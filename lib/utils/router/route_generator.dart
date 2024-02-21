import 'package:currency_converter/bloc/currency/bloc.dart';
import 'package:currency_converter/data/repositories/currencies_repositoy.dart';
import 'package:currency_converter/ui/modules/currency_converter/home_page.dart';
import 'package:currency_converter/ui/modules/landing/splash/splash_page.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:currency_converter/utils/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  RouteGenerator();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    debugPrint('Route to: ${settings.name}');
    switch (settings.name) {
      /// Landing Pages
      case RouteNames.rSplashPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.rSplashPage),
          builder: (_) => const SplashPage(),
        );

      /// Main Pages
      case RouteNames.rHomePage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.rHomePage),
          builder: (_) =>
              BlocProvider(create: (context) => CurrenciesBloc(currenciesRepository: CurrenciesRepositoryImpl()), child: HomePage()),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(AppLocalizations.translateInstant('error', defaultText: 'Error'))),
      );
    });
  }
}
