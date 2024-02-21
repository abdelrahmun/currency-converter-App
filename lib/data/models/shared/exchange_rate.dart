class CurrencyRate {
  late String code;
  late double value;

  CurrencyRate({
    required this.code,
    required this.value,
  });

  factory CurrencyRate.fromJson(Map<String, dynamic> json) {
    return CurrencyRate(
      code: json['code'],
      value: json['value'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'value': value,
  };
}

class ExchangeCurrencyData {
  late Map<String, CurrencyRate> currencies;
  late DateTime lastUpdatedAt;

  ExchangeCurrencyData({
    required this.currencies,
    required this.lastUpdatedAt,
  });

  factory ExchangeCurrencyData.fromJson(Map<String, dynamic> json) {
    Map<String, CurrencyRate> currencies = {};
    json['data'].forEach((key, value) {
      currencies[key] = CurrencyRate.fromJson(value);
    });
    return ExchangeCurrencyData(
      currencies: currencies,
      lastUpdatedAt: DateTime.parse(json['meta']['last_updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'meta': {'last_updated_at': lastUpdatedAt.toIso8601String()},
    'data': { for (var k in currencies.keys) k : currencies[k]!.toJson() },
  };
}
