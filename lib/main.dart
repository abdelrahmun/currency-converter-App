import 'package:currency_converter/data/sources/local/cache_helper.dart';
import 'package:currency_converter/data/sources/local/isar_local.dart';
import 'package:currency_converter/root.dart';
import 'package:currency_converter/utils/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = false;
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

   setupLocator();

  /// Lock device on portrait mode only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const Root());
}
