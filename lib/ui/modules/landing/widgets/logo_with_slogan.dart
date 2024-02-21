import 'package:currency_converter/ui/modules/landing/splash/cubit/splash_cubit.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/ui/style/app_themes.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:currency_converter/utils/core_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class LogoWithSlogan extends StatefulWidget {
  const LogoWithSlogan({super.key});

  @override
  State<LogoWithSlogan> createState() => _LogoWithSloganState();
}

class _LogoWithSloganState extends State<LogoWithSlogan> {
  late SplashCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = SplashCubit();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Shimmer.fromColors(
          baseColor: AppColors.white,
          highlightColor: AppColors.primaryColor,
          period: const Duration(seconds: 2),
          child: Text('Currency Converter', style: AppThemes.landingTextStyle(context, isBold: true)),
        ),
      ),
    );
  }
}
