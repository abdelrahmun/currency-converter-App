import 'package:currency_converter/data/sources/local/isar_local.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setupLocator()async {
  getIt.registerSingletonAsync<IsarController>(() async => await IsarController.create());
}
