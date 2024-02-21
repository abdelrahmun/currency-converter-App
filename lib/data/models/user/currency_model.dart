import 'package:currency_converter/utils/constants.dart';
import 'package:isar/isar.dart';

class Currency {
  final String? code;
  final String? name;
  final String? symbol;
  final String? symbolNative;
  final int? decimalDigits;
  final int? rounding;
  final String? type;
  final List<String>? countries;

  Currency({
    this.code,
    this.name,
    this.symbol,
    this.symbolNative,
    this.decimalDigits,
    this.rounding,
    this.type,
    this.countries,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
      symbolNative: json['symbol_native'],
      decimalDigits: json['decimal_digits'],
      rounding: json['rounding'],
      type: json['type'],
      countries: (json['countries'] as List).map((e) => e as String).toList(),
    );
  }

  @override
  String toString() {
    return code ?? Constants.defaultBaseCurrency;
  }
}

class CurrencyData {
  Map<String, Currency>? data;

  CurrencyData({this.data});

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    final dataMap = Map.from(json['data']);

    return CurrencyData(
      data: dataMap?.map((key, value) => MapEntry(key, Currency.fromJson(value))),
    );
  }
}
