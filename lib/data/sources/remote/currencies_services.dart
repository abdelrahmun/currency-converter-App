import 'dart:convert';
import 'dart:developer';

import 'package:currency_converter/utils/api_caller.dart';
import 'package:crypto/crypto.dart';
import 'package:currency_converter/utils/constants.dart';

class CurrenciesServices {
  final APICaller _apiCaller = APICaller();

  Future getAllCurrencies() async {
    _apiCaller.setUrl('currencies?type=${Constants.currencyType}');

    Map<String, String> headers = {};

    headers['apikey'] = Constants.apiKey;
    final data = await _apiCaller.getData(headers: headers);
    return data;
  }

  Future getExchangeRate({required String baseCurrency}) async {
    _apiCaller.setUrl('latest?base_currency=${baseCurrency.toUpperCase()}&type=${Constants.currencyType}');

    Map<String, String> headers = {};

    headers['apikey'] = Constants.apiKey;
    final data = await _apiCaller.getData(headers: headers);
    return data;
  }

  Future getHistoricalData(
      {required String baseCurrency, required String targetCurrency, required String startDate, required String endDate}) async {
    _apiCaller.setUrl(
        'historical?base_currency=${baseCurrency.toUpperCase()}&currencies=$targetCurrency&date=$startDate&datetime_end=$endDate&accuracy=day');

    Map<String, String> headers = {};

    headers['apikey'] = Constants.apiKey;
    final data = await _apiCaller.getData(headers: headers);
    return data;
  }
}
