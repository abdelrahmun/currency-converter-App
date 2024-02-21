import 'package:currency_converter/data/models/shared/exchange_rate.dart';
import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_converter_cubit.dart';

abstract class CurrencyConverterStates {}

class InitialState extends CurrencyConverterStates {}
class ChangeSelectedBaseCurrency extends CurrencyConverterStates {}
class ChangeSelectedTargetCurrency extends CurrencyConverterStates {}
class CalculateExchangeAmountState extends CurrencyConverterStates {}

