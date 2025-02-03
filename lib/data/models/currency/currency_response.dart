import 'package:app/export.dart';
import 'package:annotations/annotations.dart';

part 'currency_response.g.dart';

@JsonAnnotation()
class CurrencyResponse {
  CurrencyResponse({
    required this.id,
    required this.code,
    required this.exchangeRate,
    required this.isBaseCurrency,
    required this.name,
    required this.symbol,
  });

  final int id;
  final String code;
  final ExchangeRateResponse exchangeRate;
  final bool isBaseCurrency;
  final String name;
  final String symbol;

  // fromJson
  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {}
    try {
      return _$CurrencyResponseFromJson(json);
    } catch (_) {
      if (kDebugMode) {}
      throw _;
    }
  }

  // toJson
  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}

extension $CustomCurrencyResponseExtension on CurrencyResponse {}
