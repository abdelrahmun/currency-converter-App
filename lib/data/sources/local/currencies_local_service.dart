import 'dart:developer';

import 'package:currency_converter/data/models/local/currency_local_model.dart';
import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/data/sources/local/isar_local.dart';
import 'package:currency_converter/main.dart';
import 'package:currency_converter/root.dart';
import 'package:currency_converter/utils/get_it.dart';
import 'package:isar/isar.dart';

class CurrenciesLocalServices {
  // ---------->>> SAVE <<<----------

  Future<void> saveCurrencies({required CurrencyLocalModel currencyLocalModels}) async {
    try {
      await getIt<IsarController>().isar.writeTxn(() async {
        await getIt<IsarController>().isar.currencyLocalModels.put(currencyLocalModels);
      });
      print('Currency saved successfully!');
    } on IsarError catch (error) {
      print('Error saving currency: $error');
      // Handle error gracefully, rethrow or provide user feedback
    } catch (error) {
      print('Unexpected error saving currency: $error');
      rethrow; // Rethrow for higher-level handling
    }
  }

  // ---------->>> CHECK <<<----------
  Future<bool> hasCurrencies() async {
    try {
      final currencies = await getIt<IsarController>().isar.currencyLocalModels.where().findAll();
      return currencies.isNotEmpty;
    } on IsarError catch (error) {
      // Handle Isar-specific errors gracefully
      log('Error checking for currencies: $error');
      return false; // Assuming no currencies exist in case of error
    } catch (error) {
      // Handle other unexpected errors
      log('Unexpected error checking for currencies: $error');
      rethrow; // Rethrow to allow higher-level error handling
    }
  }

  Future<String?> getCurrencies() async {
    CurrencyLocalModel? res = await getIt<IsarController>().isar.currencyLocalModels.where().findFirst();

    if (res != null) {
      return res.currencies;
    }
    return null;
  }
}
