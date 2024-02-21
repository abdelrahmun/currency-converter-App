import 'package:currency_converter/data/models/local/currency_local_model.dart';
import 'package:currency_converter/data/models/shared/currency_historical_data_model.dart';
import 'package:currency_converter/data/models/shared/exchange_rate.dart';
import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/data/repositories/app_settings_repositoy.dart';
import 'package:currency_converter/data/repositories/currencies_repositoy.dart';
import 'package:currency_converter/data/sources/local/currencies_local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';

part 'state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final CurrenciesRepository currenciesRepository;

  CurrenciesBloc({
    required this.currenciesRepository,
  }) : super(CurrenciesInitial()) {
    on<GetAllCurrencies>(_onLoadCurrencies);
    on<GetExchangeRate>(_onGetExchangeRate);
    on<GetHistoricalData>(_onGetHistoricalData);
  }

  _onLoadCurrencies(GetAllCurrencies event, Emitter<CurrenciesState> emit) async {
    emit(CurrenciesLoadingState());

    try {
      final result = await currenciesRepository.getAllCurrencies();
      result.fold((l) {
        emit(CurrenciesErrorState());
      }, (result) {
        emit(CurrenciesLoadedState(currencyData: result));
      });
    } catch (e) {
      emit(CurrenciesErrorState());
    }
  }

  _onGetExchangeRate(GetExchangeRate event, Emitter<CurrenciesState> emit) async {
    emit(ExchangeRateLoadingState());

    try {
      final result = await currenciesRepository.getExchangeRate(baseCurrency: event.baseCurrency);
      result.fold((l) {
        emit(ExchangeRateErrorState(message: l.message));
      }, (result) {
        emit(ExchangeRateLoadedState(exchangeCurrencyData: result));
      });
    } catch (e) {
      emit(ExchangeRateErrorState(message: e.toString()));
    }
  }

  _onGetHistoricalData(GetHistoricalData event, Emitter<CurrenciesState> emit) async {
    emit(GetHistoricalDataLoadingState());

    try {
      final result = await currenciesRepository.getHistoricalData(
          baseCurrency: event.baseCurrency, targetCurrency: event.targetCurrency, startDate: event.startDate, endDate: event.endDate);
      result.fold((l) {
        emit(GetHistoricalDataErrorState(message: l.message));
      }, (result) {
        emit(GetHistoricalDataLoadedState(exchangeCurrencyData: result));
      });
    } catch (e) {
      emit(GetHistoricalDataErrorState(message: e.toString()));
    }
  }
}
