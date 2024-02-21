import 'dart:convert';

import 'package:currency_converter/data/models/user/currency_model.dart';

class CurrencyHistoricalModel {
  final String datetime;
  final Map<String, Currency> currencies;

  CurrencyHistoricalModel({required this.datetime, required this.currencies});

  factory CurrencyHistoricalModel.fromJson(Map<String, dynamic> json) {
    // Parse currencies
    Map<String, Currency> currenciesMap = {};
    json['currencies'].forEach((key, value) {
      currenciesMap[key] = Currency.fromJson(value);
    });

    return CurrencyHistoricalModel(
      datetime: json['datetime'],
      currencies: currenciesMap,
    );
  }
}
