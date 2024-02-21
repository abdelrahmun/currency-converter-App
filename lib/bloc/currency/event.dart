part of 'bloc.dart';

@immutable
abstract class CurrenciesEvent {}

class GetAllCurrencies extends CurrenciesEvent {}

class GetExchangeRate extends CurrenciesEvent {
  final String baseCurrency;

  GetExchangeRate({required this.baseCurrency});
}

class GetHistoricalData extends CurrenciesEvent {
  final String baseCurrency;
  final String targetCurrency;
  final String startDate;
  final String endDate;

  GetHistoricalData({required this.baseCurrency, required this.targetCurrency, required this.startDate, required this.endDate});
}
