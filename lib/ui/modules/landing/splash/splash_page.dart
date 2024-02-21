import 'dart:async';
import 'dart:convert';

import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/data/sources/local/cache_helper.dart';
import 'package:currency_converter/data/sources/local/cache_keys.dart';
import 'package:currency_converter/ui/modules/landing/widgets/logo_with_slogan.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/utils/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late String _route;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        body: const Center(child: LogoWithSlogan()),
      ),
    );
  }

  startTime() async {
    // try {
      String? token = CacheHelper.get(CacheKeys.spToken);
      _route = RouteNames.rHomePage;

      return Timer(const Duration(seconds: Constants.splashDuration), () => Navigator.of(context).pushReplacementNamed(_route));
    }

  }
