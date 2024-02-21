import 'dart:convert';

import 'package:currency_converter/data/models/local/currency_local_model.dart';
import 'package:currency_converter/data/models/shared/currency_historical_data_model.dart';
import 'package:currency_converter/data/models/shared/exchange_rate.dart';
import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/data/network/failure.dart';
import 'package:currency_converter/data/sources/local/currencies_local_service.dart';
import 'package:currency_converter/data/sources/remote/currencies_services.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

abstract class CurrenciesRepository {
  Future<Either<Failure, CurrencyData>> getAllCurrencies();

  Future<Either<Failure, ExchangeCurrencyData>> getExchangeRate({required String baseCurrency});

  Future<Either<Failure, List<CurrencyHistoricalModel>>> getHistoricalData(
      {required String baseCurrency, required String targetCurrency, required String startDate, required String endDate});
}

class CurrenciesRepositoryImpl extends CurrenciesRepository {
  final CurrenciesServices currenciesServices = CurrenciesServices();
  final CurrenciesLocalServices currenciesLocalServices = CurrenciesLocalServices();

  @override
  Future<Either<Failure, CurrencyData>> getAllCurrencies() async {
    try {
      if (await currenciesLocalServices.hasCurrencies()) {
        return await _getDataFromLocal();
      } else {
        return await _getDataFromRemote();
      }
    } catch (e) {
      final res = await _getDataFromRemote();
      return res;
    }
  }

  @override
  Future<Either<Failure, ExchangeCurrencyData>> getExchangeRate({required String baseCurrency}) async {
    try {
      final Response response = await currenciesServices.getExchangeRate(baseCurrency: baseCurrency);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ExchangeCurrencyData.fromJson(jsonDecode(response.body)));
      } else {
        return Left(Failure(response.statusCode, jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Left(Failure(1, 'Error Occurred'));
    }
  }

  @override
  Future<Either<Failure, List<CurrencyHistoricalModel>>> getHistoricalData(
      {required String baseCurrency, required String targetCurrency, required String startDate, required String endDate}) async {
    try {
      final Response response = await currenciesServices.getHistoricalData(
          baseCurrency: baseCurrency, targetCurrency: targetCurrency, endDate: endDate, startDate: startDate);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List decodedList = jsonDecode(response.body);
        List<CurrencyHistoricalModel> data = List.generate(
            decodedList.length, (index) => CurrencyHistoricalModel.fromJson(decodedList[index]));
        return Right(data);
      } else {
        return Left(Failure(response.statusCode, jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Left(Failure(1, 'Error Occurred'));
    }
  }

  Future<Either<Failure, CurrencyData>> _getDataFromLocal() async {
    final String? currencyData = await currenciesLocalServices.getCurrencies();

    try {
      final parsedResponse = CurrencyData.fromJson(jsonDecode(currencyData ?? "{}"));

      return Right(parsedResponse);
    } catch (e) {
      return Left(Failure(1, 'Error Occurred'));
    }
  }

  Future<Either<Failure, CurrencyData>> _getDataFromRemote() async {
    try {
      final Response response = await currenciesServices.getAllCurrencies();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parsedResponse = CurrencyData.fromJson(jsonDecode(response.body));

        CurrencyLocalModel currencyLocalModel = CurrencyLocalModel();
        currencyLocalModel.currencies = response.body;
        currenciesLocalServices.saveCurrencies(currencyLocalModels: currencyLocalModel);

        return Right(parsedResponse);
      } else {
        return Left(Failure(response.statusCode, jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Left(Failure(1, 'Error Occurred'));
    }
  }
}
