part of 'bloc.dart';

@immutable
abstract class CurrenciesState {}

class CurrenciesInitial extends CurrenciesState {}

// Load All Currencies

class CurrenciesLoadingState extends CurrenciesState {}

class CurrenciesLoadedState extends CurrenciesState {
  final CurrencyData currencyData;

  CurrenciesLoadedState({required this.currencyData});
}

class CurrenciesErrorState extends CurrenciesState {}

// Get Exchange Rate

class ExchangeRateLoadingState extends CurrenciesState {}

class ExchangeRateLoadedState extends CurrenciesState {
  final ExchangeCurrencyData exchangeCurrencyData;

  ExchangeRateLoadedState({required this.exchangeCurrencyData});
}

class ExchangeRateErrorState extends CurrenciesState {
  final String message;

  ExchangeRateErrorState({required this.message});
}

// Get Exchange Rate

class GetHistoricalDataLoadingState extends CurrenciesState {}

class GetHistoricalDataLoadedState extends CurrenciesState {
  final List<CurrencyHistoricalModel> exchangeCurrencyData;

  GetHistoricalDataLoadedState({required this.exchangeCurrencyData});
}

class GetHistoricalDataErrorState extends CurrenciesState {
  final String message;

  GetHistoricalDataErrorState({required this.message});
}
