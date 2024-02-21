part of 'currency_converter_state.dart';

class CurrencyConverterCubit extends Cubit<CurrencyConverterStates> {
  CurrencyConverterCubit() : super(InitialState());

  Currency? selectedBaseCurrency;

  Currency? selectedTargetCurrency;

  void changeSelectedCurrency(Currency currency) {
    selectedBaseCurrency = currency;
    emit(ChangeSelectedBaseCurrency());
  }

  void changeTargetCurrency(Currency currency) {
    selectedTargetCurrency = currency;
    emit(ChangeSelectedTargetCurrency());
  }

  double? exchangeAmount;

  void calculateExchangeRate(ExchangeCurrencyData currencyRate, double amount) {
    exchangeAmount = amount * (currencyRate.currencies[selectedTargetCurrency?.code]?.value ?? 1);
    emit(CalculateExchangeAmountState());
  }
}
