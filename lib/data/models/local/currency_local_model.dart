import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:isar/isar.dart';

part 'currency_local_model.g.dart';

@collection
class CurrencyLocalModel {
  Id id = 1; // you can also use id = null to auto increment
  String? currencies;

}
